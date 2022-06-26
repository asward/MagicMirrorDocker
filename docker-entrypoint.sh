#!/bin/bash
set -e

# If no moudles mouted by volume, copy in the defaults
if [ ! "$(ls -A /opt/magic_mirror/modules)" ]; then
    cp -Rn /opt/default_modules/. /opt/magic_mirror/modules
fi

# If no config mouted by volume, copy in the defaults
if [ ! "$(ls -A /opt/magic_mirror/config)" ]; then
    cp -Rn  /opt/default_config /opt/magic_mirror/config
fi

if [ -f "/opt/magic_mirror/config/config.js.template" ]; then
    envsubst < /opt/magic_mirror/config/config.js.template > /opt/magic_mirror/config/config.js
fi

exec "$@"
