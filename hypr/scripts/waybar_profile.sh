#!/bin/bash

menu=("Topbar" "Bottombar")
choice=$(printf "%s\n" "${menu[@]}" | fuzzel --dmenu -i -p "Waybar Profile: ")

waybar_pid=$(pgrep -x waybar)
kill $waybar_pid

case $choice in
    Topbar)
      hyprctl dispatch exec "waybar -c $HOME/.config/waybar/topbar/config.jsonc -s $HOME/.config/waybar/topbar/style.css"
      ;;
    Bottombar)
      hyprctl dispatch exec "waybar -c $HOME/.config/waybar/bottombar/config.jsonc -s $HOME/.config/waybar/bottombar/style.css"
      ;;
esac
