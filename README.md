# Chromium Kiosk

This project builds a small Balena container that runs Chromium in kiosk mode. It is
intended for devices like the Raspberry Pi 4 or 400.

## Files

- **Dockerfile.template** – installs Chromium and X11 utilities and sets up the
  container entrypoint.
- **start.sh** – entry script that launches Chromium and restarts it if it exits.

## Configuration

Set the `BROWSER_URL` environment variable to change the page that loads on
startup. If not provided, the script falls back to `http://192.168.50.10`.

## Usage

1. Build the image locally or deploy with Balena Cloud.

   ```bash
   balena build --device-type raspberrypi4-64 .
   # or
   balena push <appname>
   ```

2. Optionally define the URL:

   ```bash
   balena env add BROWSER_URL https://example.org --application <appname>
   ```

After the container boots, Chromium opens in kiosk mode and navigates to the
configured URL.

## License

MIT
