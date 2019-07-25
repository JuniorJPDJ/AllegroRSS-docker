#!/usr/bin/env bash
set -e

# Start Xvfb
rm -f /tmp/.X99-lock
Xvfb -ac -screen scrn 1024x768x24 :99.0 &
export DISPLAY=:99.0

exec "$@"
