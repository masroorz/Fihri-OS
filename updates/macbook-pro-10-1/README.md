# MacBook Pro 10,1 update package

Hardware target: Apple MacBook Pro 10,1 (Mid-2012, Retina).

This package addresses DDE dock/shell layout corruption, excess idle CPU from
ClamAV services, missing BCM4331 wireless firmware/driver, and the resulting
absence of Wi-Fi controls in the network tray. The Wi-Fi UI is expected to
recover when NetworkManager detects the wireless interface; no separate tray
configuration is changed.

## Apply manually

1. Review the script and ensure you have a working wired/network connection.
2. Extract the package, then run `sudo ./install.sh` to check prerequisites.
3. Run `sudo ./install.sh --confirm` from the target desktop user's account.
4. Reboot, then verify `nmcli device`, `nmcli device wifi list`, and that the
   DDE dock and network tray render. If `bcmwl-kernel-source` is unavailable,
   the installer uses Ubuntu's `firmware-b43-installer`; that package obtains
   firmware from its configured distribution source. Firmware is not bundled
   here because redistribution terms are not established.

The installer keeps a timestamped backup of the three DDE shell state
directories in the user's home directory. It masks `clamav-daemon` and
`clamav-freshclam`; re-enable them with `sudo systemctl unmask --now
clamav-daemon clamav-freshclam` if you intentionally use resident scanning.
Masking may also require package-policy review on future upgrades.

Nouveau clocks are not changed: the driver does not expose a supported,
reliable clock-tuning interface on this hardware. The package limits its GPU
changes to eliminating the reported DDE crash loop and its CPU load.

## Detection and future auto-update integration

`detect.sh` exits zero only when `dmidecode` reports `MacBookPro10,1`.
`update.json` is the package metadata entry point. Future updater integration
should download a signed release artifact, verify its published digest and
signature, run detection, and require the same explicit install confirmation;
this repository does not currently register machine-specific automatic
updates.
