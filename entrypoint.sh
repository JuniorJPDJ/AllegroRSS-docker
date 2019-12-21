#!/usr/bin/env bash
set -e

# Start Xvfb
rm -f /tmp/.X99-lock
Xvfb -ac -screen scrn 1024x768x24 :99.0 &
export DISPLAY=:99.0

# autokill container after 24h (force restart, as it crashes after few days and doesnt kill itself)
(sleep $((24*60*60)) ; echo 24h uptime - Killing ; kill $$) &

exec "$@"
