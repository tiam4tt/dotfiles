#!/bin/bash

menu=("Topbar" "Bottombar")
choice=$(printf "%s\n" "${menu[@]}" | fuzzel --dmenu -i -p "Waybar Profile: ")

if [ -z "$choice" ]; then
    exit 1
fi

waybar_pid=$(pgrep -x waybar)
if [ -n "$waybar_pid" ]; then
  kill $waybar_pid
fi

case $choice in
    Topbar)
      bar="topbar"
      ;;
    Bottombar)
      bar="bottombar"
      ;;
esac

echo "exec = pkill waybar; waybar -c $HOME/.config/waybar/$bar/config.jsonc -s $HOME/.config/waybar/$bar/style.css" > $HOME/.config/hypr/autostart/bar_profile.conf
