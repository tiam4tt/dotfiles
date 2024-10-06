#!/bin/bash

TOUCHPAD="asuf1204:00-2808:0104-touchpad"
export STATUS_FILE="$HOME/touchpad.status"

if [ -f $STATUS_FILE  ]; then
  if [ "$(cat $STATUS_FILE)" = "true" ]; then 
    hyprctl keyword device[$TOUCHPAD]:enabled true
  else
    hyprctl keyword device[$TOUCHPAD]:enabled false 
  fi
fi
