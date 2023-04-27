#!/bin/bash

PID=$(pgrep ngrok)

if [ -n "$PID" ]; then
        kill $PID
        echo "kill $PID Done"
else
        echo "ngrok is not running"
fi
