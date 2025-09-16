#!/bin/bash

STATE_FILE="/tmp/power_state"

if [[ -f "$STATE_FILE" && "$(cat "$STATE_FILE")" == "AC" ]]; then
    echo "BAT" > $STATE_FILE
else
    echo "AC" > $STATE_FILE
fi