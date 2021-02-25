#!/bin/bash

set -euo pipefail

SERVER_PORT=${SERVER_PORT:-2456}
SERVER_PUBLIC=${SERVER_PUBLIC:-1}
export LD_LIBRARY_PATH=:/server/linux64
export SteamAppId=892970

# Tip: Make a local copy of this script to avoid it being overwritten by steam.
# NOTE: Minimum password length is 5 characters & Password cant be in the server name.
# NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.
./valheim_server.x86_64 \
  -name "${SERVER_NAME}" \
  -port ${SERVER_PORT} \
  -world "${SERVER_WORLD}" \
  -password "${SERVER_PASSWORD}" \
  -savedir "/data" \
  -public ${SERVER_PUBLIC}
