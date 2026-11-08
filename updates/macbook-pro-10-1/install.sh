#!/bin/bash
set -euo pipefail

if [[ ${EUID} -ne 0 ]]; then
    echo "Run with sudo: sudo ./install.sh" >&2
    exit 1
fi

product=$(dmidecode -s system-product-name 2>/dev/null || true)
if [[ "$product" != "MacBookPro10,1" ]]; then
    echo "Refusing to install: expected MacBookPro10,1, detected '${product:-unknown}'." >&2
    exit 1
fi

if [[ ${1:-} != --confirm ]]; then
    echo "This will reset per-user DDE shell state, mask ClamAV services, and install available Broadcom firmware/driver packages."
    echo "Review README.md, then rerun as: sudo ./install.sh --confirm"
    exit 2
fi

user=${SUDO_USER:-}
if [[ -z "$user" || "$user" == root ]]; then
    echo "Run sudo from the desktop user's login so the correct DDE profile can be backed up." >&2
    exit 1
fi
user_home=$(getent passwd "$user" | cut -d: -f6)
if [[ ! -d "$user_home" ]]; then
    echo "Could not resolve home directory for $user." >&2
    exit 1
fi

stamp=$(date +%Y%m%d-%H%M%S)
backup="$user_home/dde-shell-backup-$stamp"
mkdir -m 700 "$backup"
for path in .config/dde-shell .cache/dde-shell .local/share/dde-shell; do
    if [[ -e "$user_home/$path" ]]; then
        mkdir -p "$backup/$(dirname "$path")"
        mv "$user_home/$path" "$backup/$path"
    fi
done
chown -R "$user:$user" "$backup"

pkill -x dde-shell 2>/dev/null || true
systemctl stop clamav-freshclam.service clamav-daemon.service 2>/dev/null || true
systemctl mask clamav-freshclam.service clamav-daemon.service

export DEBIAN_FRONTEND=noninteractive
apt-get update
if apt-cache show bcmwl-kernel-source >/dev/null 2>&1; then
    apt-get install -y bcmwl-kernel-source
else
    apt-get install -y firmware-b43-installer
fi

modprobe -r wl b43 2>/dev/null || true
modprobe b43 2>/dev/null || modprobe wl 2>/dev/null || true

echo "DDE state backed up at: $backup"
echo "Installed firmware/driver package. Reboot to reload the graphics and wireless stack."
echo "After reboot verify with: nmcli device; nmcli device wifi list"
