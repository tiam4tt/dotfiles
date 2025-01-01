#!/bin/bash

DISPLAY="eDP-1"
AC_STATUS=$(cat /sys/class/power_supply/ACAD/online)
TOUCHPAD="asuf1204:00-2808:0104-touchpad"
export STATUS_FILE="$HOME/touchpad.status"

if [ "$AC_STATUS" == "1" ]; then
  hyprctl keyword monitor $DISPLAY, 1920x1080@144, 0x0, 1.2
  hyprctl notify -1 2000 "refresh rate is at 144Hz"
else
  hyprctl keyword monitor $DISPLAY, 1920x1080@60, 0x0, 1.2
  hyprctl notify -1 2000 "refresh rate is at 60Hz"
fi
