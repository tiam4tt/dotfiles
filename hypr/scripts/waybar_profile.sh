#!/bin/bash

menu=("Topbar" "Topbar 2" "Bottombar")
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
      config="$HOME/.config/waybar/topbar/config.jsonc"
      style="$HOME/.config/waybar/topbar/style.css"
      ;;
    Bottombar)
      config="$HOME/.config/waybar/bottombar/config.jsonc"
      style="$HOME/.config/waybar/bottombar/style.css"
      ;;
    "Topbar 2")
        config="$HOME/.config/waybar/topbar/config2.jsonc"
        style="$HOME/.config/waybar/topbar/style2.css"
        ;;
esac

echo "exec = pkill waybar; waybar -c $config -s $style" > $HOME/.config/hypr/autostart/bar_profile.conf
