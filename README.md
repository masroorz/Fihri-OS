# Fihri OS 1.0 is here!

**A beautiful, private, Windows-familiar Linux desktop.**

Fihri OS 1.0 is a free, open-source (GPLv3) desktop operating system built on Ubuntu 24.04 LTS with the Deepin Desktop Environment. It pairs a polished, modern interface with privacy-respecting defaults, an encrypted office suite, enterprise-friendly domain tools, and a remote desktop experience designed for real work — all at no cost.

- 📦 **Download:** [Releases](../../releases) — pick the build for your machine:
  - **Fihri OS 1.0 SP1** *(recommended)* — the full desktop with **Service Pack 1 pre-installed** — [v1.0-sp1](../../releases/tag/v1.0-sp1). `fihri-os-1.0-amd64-sp1.iso` ships as three 7z volumes (`fihri-os-1.0-amd64-sp1.7z.001/.002/.003`; GitHub's 2 GiB asset cap). Extract by opening `.7z.001` with [7-Zip](https://www.7-zip.org/) on Windows, or `7z x fihri-os-1.0-amd64-sp1.7z.001` on Linux. ISO: 5,620,156,416 bytes (5.23 GiB), SHA-256 `96f9ccc11de12adf67cacfebf9b4a9a42aef29b7cc1107169896846e5acae46d`; Full acceptance-tested 2026-11-19 (rev11 2026-11-24: dock tooltips fixed (true tooltip windows, matches Deepin VM reference), selftest/heal false-notification fixed, all SP1 1.5.6 content baked; rev10 2026-11-22: RDP client fix (TLX segfault demoted, distro xfreerdp preferred, auto-fallback + collapsible connection log), Update Center held-package fix (exit-100), wireless panel widened 330->390px, Update Center terminal sync; WiFi & tray fixes (`dde-tray-loader` canlinux17–19); File Manager "Folder is empty" fix (`dde-file-manager` canlinux1); MacBook hardware support 1.2.3 (WiFi, trackpad, fn-mode, nouveau guard); laptop hot-keys; printer setup with online driver search; screen recorder 6.5.18; USB-tethering support
- 📋 **What's in 1.0:** [RELEASE-NOTES.md](RELEASE-NOTES.md) · **Lean vs full 1.0:** [RELEASE-NOTES-LEAN.md](RELEASE-NOTES-LEAN.md)
- 📊 **Full release report** (requirements, Windows 11 comparison, measurements, clean-profile audit): [docs/FIHRI-OS-1.0-REPORT.md](docs/FIHRI-OS-1.0-REPORT.md)

## Fihri OS Lean 1.0 r11 — the same desktop for small machines

**Current Lean release: r11**, published under [v1.0-lean](../../releases/tag/v1.0-lean). The ISO ships as three 7z volumes (`fihri-os-lean-1.0-amd64-r11.7z.001/.002/.003`) — download all three plus the signed checksums and extract with 7-Zip ([download & verify instructions](RELEASE-NOTES-LEAN.md#download--verify)). Reassembled ISO SHA-256: `be8bb8966eacaffa6750006e6aca20719c4414bce33c05a1e99adb990efb612b`.

r11 fixes dock/tray **tooltips** (no more window frames with X buttons) and a **Files app memory leak**, adds **MacBook Pro support** (BCM4331 WiFi, macOS-like trackpad scrolling, dark-mode icons), and trims the live session to ≈ 1400 MB idle RAM with ~17–18 s boots. It carries all prior fixes: **Auto (erase disk) is the default** on the single-disk path, live-session automount is suppressed, dual-boot is enabled, **USB-Ethernet is fixed**, the installer's packages backend is fixed, and the **22 GB storage floor** is retained.

> ℹ️ **Planned:** a new Lean build derived from the SP1 base is in the pipeline.

[**Lean 1.0**](../../releases/tag/v1.0-lean) is a retuned build of Fihri OS 1.0 for the hardware the full release priced out — old laptops with 2–4 GB RAM and 22–64 GB disks. Same DDE desktop, same office stack, same RDP server, same privacy defaults; the differences are all in the resource budget ([full comparison](RELEASE-NOTES-LEAN.md)):

- **Runs in 2 GB RAM** — the installer RAM floor drops from 4 GB to **2 GB**, and the live desktop itself was verified in QEMU (BIOS + UEFI) at 2 GB with zero OOM kills and ~590–650 MB still available after the desktop settles. zram (`zram-config`) plus a small swap (≤ 10% of disk) and `vm.swappiness=180` stretch little-RAM machines further.
- **Disk floor lowered 32 GB → 22 GB** — based on the measured 13.34 GiB installed tree (budget: 16 GiB root + EFI + /boot + 2 GiB home + small swap). Real 29–30 GB-class student SSDs now install instead of being stranded; 64 GB SSD stays the recommended size.
- **Auto partitioning is the default for small disks** — the guided erase-disk layout's root minimum drops 25 GB → 16 GB. r6 reaches the account page with Next alone on the tested single-disk setup; alongside/manual partitioning remains available for preserving existing systems.
- **ClamAV is an App Store offer, not preinstalled** — the 7-package AV stack is out of the base image (−120 MiB ISO); if you want it, one click in the Updates window's Application Updates / Offers section installs the scanner + signature DB with **no resident daemon** (zero idle RAM) and a dormant weekly on-demand scan timer.
- Plus quieter/faster boot: Samba/ModemManager/crash-reporting masked, 10 boot hogs disabled, 2 s GRUB timeout, reduced desktop effects (dock translucency and themes stay).

Prefer full 1.0 if you have 4 GB+ RAM and 32 GB+ disk and want on-access ClamAV, Samba sharing and full desktop effects out of the box.

## Screenshots

![Fihri OS 1.0 desktop — hero wallpaper, filled icons and translucent dock](screenshots/fihri-os-1.0-desktop.png)

*Fihri OS 1.0 desktop — captured on the reference machine, 2026-11-01, showing the Colorful-Abstraction02 wallpaper that greets every fresh install.*

| | | |
|---|---|---|
| ![Windowed launcher](screenshots/fihri-os-1.0-launchpad.png)<br>**Launcher** — app grid with working search | ![Deepin File Manager](screenshots/fihri-os-1.0-files.png)<br>**Files** — Computer view with quick-access sidebar | ![Fihri OS Updates list](screenshots/fihri-os-1.0-updates.png)<br>**Fihri OS Updates** — apt + app + driver sections, choose what to install |
| ![ElixirOffice start page](screenshots/fihri-os-1.0-elixiroffice.png)<br>**ElixirOffice** — start page with templates | ![CryptPad home](screenshots/fihri-os-1.0-cryptpad.png)<br>**CryptPad** — encrypted office, document grid | ![Remote Work wizard](screenshots/fihri-os-1.0-remote.png)<br>**Remote Work** — Citrix / VMware Horizon / RDP wizard |
| ![Quick Actions panel](screenshots/fihri-os-1.0-quickpanel.png)<br>**Quick Actions panel** — notifications + weather / calendar / memory / world-clock widgets | ![Settings — Personalization](screenshots/fihri-os-1.0-personalization.png)<br>**Settings — Personalization** — the full theme gallery | ![Control Center settings grid](screenshots/fihri-os-1.0-settings.png)<br>**Control Center** — system settings |
| ![ElixirOffice Writer](screenshots/fihri-os-1.0-elixiroffice-writer.png)<br>**ElixirOffice Writer** — Word-compatible editing | ![ElixirOffice Spreadsheet](screenshots/fihri-os-1.0-elixiroffice-spreadsheet.png)<br>**ElixirOffice Spreadsheet** — Excel-compatible sheets | ![ElixirOffice Presentation](screenshots/fihri-os-1.0-elixiroffice-presentation.png)<br>**ElixirOffice Presentation** — PowerPoint-compatible slides |
| ![Brave Browser new tab](screenshots/fihri-os-1.0-browser.png)<br>**Brave Browser** — privacy-first browsing | ![Fihri Feedback form](screenshots/fihri-os-1.0-feedback.png)<br>**Fihri Feedback** — consent-gated, secret-redacted | ![Deepin Terminal](screenshots/fihri-os-1.0-terminal.png)<br>**Terminal** — Deepin Terminal |
| ![Deepin Draw canvas](screenshots/fihri-os-1.0-draw.png)<br>**Draw** — quick sketches and annotation | ![Deepin Calculator](screenshots/fihri-os-1.0-calculator.png)<br>**Calculator** — Deepin Calculator | ![Deepin Music library](screenshots/fihri-os-1.0-music.png)<br>**Music** — Deepin Music player |

The showcase set (desktop, launcher, files, updates, ElixirOffice, CryptPad, Remote Work, Quick Actions, Settings + Personalization, Brave) was refreshed on 2026-11-01 after the 1.0 image was resealed. Capture method and per-app notes: [screenshots/MANIFEST.md](screenshots/MANIFEST.md).

## System requirements (measured)

Measured on the reference machine (i5-8250U, 12 GB RAM, Intel UHD 620, 1920×1080) — full data in the [release report](docs/FIHRI-OS-1.0-REPORT.md#1-system-requirements-measured-on-this-machine).

| Resource | Minimum | Preferred |
|---|---|---|
| **RAM** | 4 GB (installer blocks below) | 8 GB (DDE core ≈ 0.9–1.1 GB; browser session ≈ 2.1 GB) |
| **Storage** | 32 GB (installer blocks below) | 64 GB SSD (installed tree is 13.5 GB + updates/snapshots) |
| **CPU** | 64-bit x86-64, dual-core | 4+ cores (whole desktop+apps measured at ~3% of a 4C/8T i5) |
| **GPU** | Any Mesa-supported Intel/AMD GPU; llvmpipe software fallback works | Intel/AMD hardware GL (NVIDIA proprietary optional, consent-based offer) |
| **Display** | 1366×768 | 1920×1080 (validated; multi-monitor supported) |
| **Install media** | 8 GB USB | — |
| **Network** | Optional at install | Broadband for updates and remote-work use |

## Install

1. Download the three SP1 volumes (`fihri-os-1.0-amd64-sp1.7z.001/.002/.003`) from [Releases](../../releases), ideally together with `SHA256SUMS`, `SHA256SUMS.asc` and `fihri-release-key.pub`. Verify the signature and checksums, then extract the ISO with 7-Zip — right-click `.7z.001` → *7-Zip → Extract here* on Windows, or `7z x fihri-os-1.0-amd64-sp1.7z.001` on Linux.
2. Write the extracted `fihri-os-1.0-amd64-sp1.iso` to a USB stick (≥ 8 GB) with a **RAW writer** — [balenaEtcher](https://etcher.balena.io/) (raw by default), [Rufus](https://rufus.ie/) in **DD mode** (⚠️ plain *ISO mode* forces NTFS + an unsigned loader for this >4 GB image, which Secure-Boot laptops reject with a black screen), or `dd if=fihri-os-1.0-amd64-sp1.iso of=/dev/sdX bs=4M status=progress oflag=sync`.
3. Boot from the USB (the live session is a full Fihri OS desktop — take it for a spin).
4. Launch **Install Fihri OS** (Calamares): erase disk, replace a previous OS, install **alongside Windows**, or manual partitioning. Swap defaults to RAM size (hibernate-capable) and is user-adjustable, including none.
5. Reboot into Fihri OS. Everything in the screenshots above is preinstalled — no account, no activation, no telemetry opt-outs to hunt for.

Notes: the installer requires ≥ 4 GB RAM and ≥ 32 GB storage. On NVIDIA hardware, first graphical boot shows a one-time **consent dialog** for the tested proprietary driver — declining is remembered and nothing installs silently.

## Fihri OS 1.0 vs Windows 11

| | Windows 11 | Fihri OS 1.0 |
|---|---|---|
| **Price** | Paid license ($139 Home / $199 Pro per device) | **Free** — download, install, and share |
| **Remote Desktop (host)** | Pro/Enterprise only — Home cannot host RDP | **Full-session RDP server on every install** — H.264, clipboard, session handoff, works with the Windows 11 24H2 client |
| **Office suite** | Microsoft 365 subscription | **ElixirOffice + CryptPad included** — DOCX/XLSX/PPTX/ODF editing locally; encrypted, self-hosted collaborative pads; no cloud account required |
| **Updates** | Forced reboots on Microsoft's schedule | **User-controlled, selectable updates** with a details pane and a **Driver Updates** section |
| **Active Directory** | AD + Entra ID join | **AD join with auto-detection and a guided wizard** (no Entra ID/MDM yet — see limitations) |
| **Telemetry** | Extensive, mandatory diagnostics | **None** — local-first by design; feedback is consent-gated and secret-redacted |
| **Disk encryption** | BitLocker everywhere | **Not yet** (top honest gap — see limitations) |
| **Security / AV** | Defender (ML/reputation/SmartScreen) | **UFW on by default, ClamAV on-access, no telemetry** — signature-based, not ML-backed |
| **Customization** | Limited | **Full theme engine** — light/dark, 8 themes + custom, accent colors, translucent dock |
| **Languages out of the box** | Language packs downloaded during/after install | **7 locales fully staged in the image** — English, French, Spanish, German, Arabic, Chinese (Simplified & Traditional) with complete font coverage including Arabic shaping and CJK |
| **Backup** | Restore points + File History | **Timeshift snapshots + Déjà Dup file backup** |
| **Online account** | Pushes a Microsoft account | **None required** — a local account is all you need |
| **Ads & sponsored apps** | Start-menu suggestions, promoted apps | **None** — no ads, no sponsored apps, ever |
| **Crash reporting** | Sent to Microsoft | **None** — diagnostics never leave the machine |
| **Open source** | Closed source | **GPLv3** — every line is open and auditable |
| **AI assistant** | Copilot | None (deliberate scope) |

The full area-by-area comparison with verdicts (including where Windows 11 still wins) is in the [release report](docs/FIHRI-OS-1.0-REPORT.md#2-feature-comparison--fihri-os-10-vs-windows-11).

## 🎨 Beautiful by default

- Deepin Desktop Environment with a translucent fashion-mode dock and rounded corners
- **Full theme engine**: 8 shipped themes (bloom, flow, hazy-color, macaron, nirvana, organic-glass, square, vintage), each with light & dark variants, plus a custom theme — light/dark flips apply live and write through to every app, with dock/tray contrast bridges that keep popups readable in both modes
- Launcher with adaptive icons that stay crisp at every display scale, and Windows-style search that works
- **Quick Actions slide-in panel**: notification center plus weather, calendar, memory and world-clock widgets
- **Filled, consistent icon set** across dock, launcher, file manager, system dialogs and the login screen
- A curated fresh-user wallpaper (plus a full picker), and a deduplicated desktop right-click menu with a working "Set Wallpaper" action
- Settings search that understands synonyms (mouse / trackpad / pointer…)
- Smooth, pixel-precise trackpad scrolling (macOS-like) out of the box
- Display scaling that applies without logging out
- DisplayLink support included — USB docks and DisplayLink monitors work out of the box

## 🔒 Office that respects your privacy

- **ElixirOffice** — native editors for DOCX/XLSX/PPTX/ODF/RTF/CSV
- **CryptPad** — self-hosted, end-to-end-encrypted collaboration: documents, spreadsheets, slides, forms and more
- Familiar **ribbon-style toolbars** in both suites
- CryptPad runs on-demand and loopback-only (binds to 127.0.0.1; 0 MB while idle)
- Works fully offline; cloud sync greys itself out when you're offline instead of failing
- Opens `.docx`, `.xlsx`, `.pptx`, and `.odt` files by default

## 🔄 Windows-style updates, under your control

- Sectioned, selectable update list with a details pane — see exactly what each update does
- Security updates grouped for quick review
- **Application Updates section** — CryptPad and ElixirOffice updates arrive in the same window as system updates
- **Driver Updates section** — hardware scan with recommended/open/proprietary flags (ubuntu-drivers engine), one click to switch GPU, Wi-Fi and DisplayLink drivers; NVIDIA hardware gets a consent-gated offer (nothing installs silently)
- **Steam one-click install** from the same window (multiverse and 32-bit libraries set up automatically)
- Clear reboot banner instead of surprise restarts
- Ubuntu 24.04 LTS base: security updates to 2029 (ESM to 2032), plus fwupd firmware updates

## 🏢 Enterprise-ready

- Active Directory auto-detection when the network cable is plugged in
- Guided domain join wizard built on realmd/sssd, with a domain field in the installer handed to first-boot join
- Polkit-secured operations, including a GUI leave flow
- No plaintext credentials anywhere in the join pipeline — covered by an automated test suite (71 tests)

## 🖥️ Remote work, both directions

- **RDP server on every install** — walk up or remote in; NLA + TLS, H.264 (AVC420), bidirectional clipboard, resize-aware cursors, session handoff with lock
- **Remote Work wizard** for connecting out: Citrix Workspace (preinstalled with the open H.264 plugin, USB, audio/mic/webcam and Teams media config), VMware Horizon (guided setup), and native Windows RDP (FreeRDP with host/user/domain/password, own window)
- Privacy-gated RDP: the physical screen blanks while you're remoted in, and the session locks when you disconnect
- Stale-connection guard: a dropped client never locks you out of your own machine
- Left-handed friendly — a mouse button-swap toggle applies to both local and remote sessions
- Keyboard layout and CapsLock/NumLock stay in sync between the remote client and the machine

## 🛡️ Security & privacy

- **No telemetry, no crash uploads, no ads, no forced online account** — vendor crash reporting (apport/whoopsie) is disabled
- **UFW firewall enabled by default** — default-deny incoming
- **ClamAV + clamonacc on-access scanning** with fresh definitions at build
- **Linux permission model by design** — polkit privilege separation, no everyday admin rights
- **Consent-based driver installs** — nothing installs silently (NVIDIA offer, updates, everything)
- Local-first **Fihri Feedback** app with 11-pattern secret redaction and zero network calls — you submit the bundle yourself
- System services listen on loopback only — CryptPad binds to `127.0.0.1`
- **systemd-hardened local services** — ProtectSystem=strict, NoNewPrivileges, PrivateTmp
- **Timeshift system snapshots** for fast, easy recovery

## 📦 Curated apps, ready to go

- **Brave** browser (default) and **Chromium** available
- **Thunderbird** mail (with built-in calendar) and dde-calendar
- **ElixirOffice** and **CryptPad** as the integrated office stack
- **VLC** media player plus the Deepin suite: Files, Terminal, Text Editor, Calendar, Music, Movie, Album, Draw, Reader, Screen Recorder, Calculator, System Monitor
- **Timeshift** backups and **GParted** partition editor
- CUPS printing, Bluetooth, Orca screen reader, on-screen keyboard
- **7 locales fully staged** — en, fr, es, de, ar, zh-Hans, zh-Hant — with the fonts to match (Noto CJK, Arabic shaping)
- 2,920 packages preinstalled; thousands more via apt / dde-store (Flathub installable post-install if you want it)

## Download and get involved

- **[Releases](../../releases)** — download Fihri OS 1.0 SP1 or Fihri OS Lean 1.0 (also: the standalone [Service Pack 1](../../releases/tag/service-pack-1) `.deb` for existing 1.0 installs, and the MacBook Hardware Support Pack)
- **[Issues](../../issues)** — feedback and bug reports; public testers are welcome
- **[RELEASE-NOTES.md](RELEASE-NOTES.md)** — 1.0 highlights · **[RELEASE-NOTES-LEAN.md](RELEASE-NOTES-LEAN.md)** — Lean 1.0 vs full 1.0
- **[docs/FIHRI-OS-1.0-REPORT.md](docs/FIHRI-OS-1.0-REPORT.md)** — the full release report: measured system requirements, Windows 11 comparison, Citrix/VMware clean-profile audit, QA state

Fihri OS is licensed under the [GNU General Public License v3.0](LICENSE). The distribution additionally contains components under their own upstream licenses (Ubuntu/Debian packages, Deepin DDE under GPL-compatible terms, Brave, Thunderbird, ElixirOffice, CryptPad under their respective licenses); each component's license ships in the installed image.
