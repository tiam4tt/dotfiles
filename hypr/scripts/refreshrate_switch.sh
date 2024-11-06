#!/bin/bash

DISPLAY="eDP-1"
AC_STATUS=$(cat /sys/class/power_supply/ACAD/online)
TOUCHPAD="asuf1204:00-2808:0104-touchpad"
export STATUS_FILE="$HOME/touchpad.status"
echo "AC_STATUS: $AC_STATUS"

if [ "$AC_STATUS" == "1" ]; then
  hyprctl keyword monitor $DISPLAY, 1920x1080@144, 0x0, 1.2
  hyprctl notify 5 2000 "fontsize:20 refresh rate is at 144Hz"
else
  hyprctl keyword monitor $DISPLAY, 1920x1080@60, 0x0, 1.2
  hyprctl notify 5 2000 "fontsize:20 refresh rate is at 60Hz"
fi

if [ -f $STATUS_FILE  ]; then
  if [ "$(cat $STATUS_FILE)" = "true" ]; then
    hyprctl keyword device[$TOUCHPAD]:enabled true
  else
    hyprctl keyword device[$TOUCHPAD]:enabled false
  fi
fi
