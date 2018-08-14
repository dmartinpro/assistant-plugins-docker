#!/bin/sh
set -e

mv /opt/assistant-plugins/configuration.json /opt/assistant-plugins/_configuration.json
cat /opt/assistant-plugins/_configuration.json | jq --arg PB_TOKEN "$PB_TOKEN" '.main.pushbullet_token = $PB_TOKEN' | jq --arg RC_CODE "$RC_CODE" '.plugins.freebox.code_telecommande = $RC_CODE' > /opt/assistant-plugins/configuration.json

# Execute Command
echo "Starting Assistant Plugin ..."
exec "$@"
