#!/bin/bash

WEBHOOK_URL=""

ngrok http 8080 &

sleep 2

NGROK_URL=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')

if [  -n "$NGROK_URL" ]; then
        curl -X POST $WEBHOOK_URL \
        -H 'Content-type: application/json' \
        --data '{"text":"NGROK_URL: '$NGROK_URL'}'
else
        curl -X POST $WEBHOOK_URL \
        -H 'Content-type: application/json' \
        --data '{"text":"Ngrok URL not found"}'
fi
