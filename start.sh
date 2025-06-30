#!/bin/bash
set -e

URL="${BROWSER_URL:-http://192.168.50.10}"

# Wait for X to be ready
if [ -x /usr/bin/startx ]; then
    startx /usr/bin/chromium-browser -- \
        --kiosk "$URL" \
        --no-first-run \
        --disable-infobars \
        --disable-session-crashed-bubble
else
    chromium-browser --kiosk "$URL" \
        --no-first-run \
        --disable-infobars \
        --disable-session-crashed-bubble
fi
