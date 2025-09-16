#!/bin/bash

MONITOR="eDP-1"
CONFIG="$HOME/.config/hypr/monitors/monitors.conf"
SIGNAL_FILE="/tmp/power_state"

# Initial read
LAST_STATE=""

while true; do
    # Only react if file changed (poll every 2s)
    if [[ -f "$SIGNAL_FILE" ]]; then
        CURRENT_STATE=$(cat "$SIGNAL_FILE")
        if [[ "$CURRENT_STATE" != "$LAST_STATE" ]]; then
            LAST_STATE="$CURRENT_STATE"

            # Choose refresh rate
            if [[ "$CURRENT_STATE" == "AC" ]]; then
                NEW_RATE="144"
            else
                NEW_RATE="60"
            fi

            # Extract current monitor config
            MONITOR_LINE=$(grep "^monitor=$MONITOR" "$CONFIG")
            if [[ -z "$MONITOR_LINE" ]]; then
                echo "Monitor config for $MONITOR not found in $CONFIG"
                continue
            fi

            # Extract resolution, position, scale, and extra options
            RES=$(echo "$MONITOR_LINE" | cut -d',' -f2 | cut -d'@' -f1)
            POS=$(echo "$MONITOR_LINE" | cut -d',' -f3)
            SCALE=$(echo "$MONITOR_LINE" | cut -d',' -f4)
            EXTRA=$(echo "$MONITOR_LINE" | cut -d',' -f5-)

            # Apply new monitor config
            echo "Switching to ${NEW_RATE}Hz ($CURRENT_STATE)"
            echo "${MONITOR},1920x1080@${NEW_RATE},${POS},${SCALE},${EXTRA}"
            hyprctl keyword monitor "${MONITOR},1920x1080@${NEW_RATE},${POS},${SCALE},${EXTRA}"q
            notify-send "Refresh Rate" "Now using ${NEW_RATE}Hz on ${CURRENT_STATE} mode"
        fi
    fi
    sleep 2
done
