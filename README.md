# balena-browser-kiosk

A Balena-powered Chromium kiosk for the Raspberry Pi 400. On boot the device launches Chromium in kiosk mode and navigates to `http://192.168.50.10`.

## Table of Contents
1. [Environment & Toolchain Setup](#environment--toolchain-setup)
2. [Repository Familiarization](#repository-familiarization)
3. [Kiosk Configuration](#kiosk-configuration)
4. [Build & Deployment](#build--deployment)
5. [Validation & Troubleshooting](#validation--troubleshooting)
6. [Documentation & Handoff](#documentation--handoff)
7. [Customization](#customization)
8. [Contributing](#contributing)
9. [License](#license)

## Environment & Toolchain Setup

### Hardware
- Raspberry Pi 400 with official power supply
- microSD card (≥ 16 GB, Class 10)
- HDMI cable and monitor

### Balena Tools
- Install the Balena CLI.
- Create or sign in to your Balena Cloud account.
- Verify you can provision and SSH into a test device.

## Repository Familiarization

Clone the repository and review key files:

```bash
git clone https://github.com/balena-io-experimental/browser.git
cd browser
```

Key files:
- `Dockerfile.template` — service image and dependencies
- `start.sh` — entrypoint launching Chromium in kiosk mode
- `config.json` — environment variable conventions (URL, flags)

## Kiosk Configuration

Define your target URL using `ENV BROWSER_URL` or a device variable in Balena Cloud.

Chromium launch flags in `start.sh`:
- `--kiosk`
- `--no-first-run`
- `--disable-infobars`
- `--incognito` (optional)

### Network & IP
- Assign a static IP (`192.168.50.10`) via DHCP reservation or `/etc/dhcpcd.conf`.
- Ensure the Pi 400 joins the correct network on boot.

## Build & Deployment

### Local build test

```bash
balena local build --arch=arm64 .
```

### Push to Balena Cloud

```bash
balena push <yourAppName>
```

### Provision your Pi400
- Download the Balena-flashed image and boot the device.
- Confirm it comes online in Balena Cloud.

## Validation & Troubleshooting

### Boot verification

```bash
balena logs <device-uuid>
```

Confirm Chromium starts and navigates to the target URL.

### Performance tuning
- Enable GPU acceleration flags (`--use-gl=egl`, `--enable-features=VaapiVideoDecoder`).
- Disable unneeded services to minimize boot time.

### Resilience
- Add a watchdog in `start.sh` to restart Chromium on crash.
- Persist cookies or local storage only if required.

## Documentation & Handoff
- Document flashing, environment variables and troubleshooting steps in this `README`.
- Create a runbook covering common failures (network down, Chromium crash).

## Customization
- Auto-update mechanism via Balena Supervisor.
- Health-check endpoint and centralized logging.

## Contributing
1. Fork the repository.
2. Create a feature branch:
   ```bash
   git checkout -b feature/your-feature
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add your feature"
   ```
4. Push to the branch:
   ```bash
   git push origin feature/your-feature
   ```
5. Open a Pull Request.
6. Follow the existing code style and include tests for significant changes.

## License

This project is licensed under the MIT License.
