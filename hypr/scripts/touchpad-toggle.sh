#!/bin/bash

TOUCHPAD="asuf1204:00-2808:0104-touchpad"
export STATUS_FILE="$HOME/touchpad.status"

enable_touchpad(){
  printf "true" > $STATUS_FILE
  hyprctl notify 5 2000 0 "fontsize:16 Touchpad enabled"
  hyprctl keyword device[$TOUCHPAD]:enabled true
}

disable_touchpad(){
  printf "false" > $STATUS_FILE
  hyprctl notify 5 2000 "rgb(ff1a00)" "fontsize:16 Touchpad disabled"
  hyprctl keyword device[$TOUCHPAD]:enabled false
}

if [ -f $STATUS_FILE ]; then
  if [ "$(cat $STATUS_FILE)" = "true" ]; then
    disable_touchpad
  else
    enable_touchpad
  fi
else
  enable_touchpad
fi
