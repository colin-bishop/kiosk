#!/bin/bash
set -e

URL="${BROWSER_URL:-http://192.168.50.10}"

cat <<EOT > ~/.xinitrc
matchbox-window-manager -use_titlebar no -use_cursor no &
chromium-browser \
  --kiosk \
  --no-first-run \
  --disable-infobars \
  --disable-session-crashed-bubble \
  --disable-features=TranslateUI \
  "$URL"
EOT
chmod +x ~/.xinitrc

while true; do
    xinit -- -nocursor
    sleep 1
done

