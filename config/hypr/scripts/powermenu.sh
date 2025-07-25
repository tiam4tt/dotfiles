#!/bin/bash

menu=("Shutdown" "Reboot" "Suspend" "Lock" "Logout" "Change wallpaper" "Waybar Profile")

choice=$(printf "%s\n" "${menu[@]}" | rofi -dmenu -i -p "Power Menu")

case $choice in
    Shutdown)
        shutdown now
        ;;
    Reboot)
        systemctl reboot
        ;;
    Suspend)
        systemctl suspend
        ;;
    Lock)
        hyprlock
        ;;
    Logout)
        loginctl terminate-session $XDG_SESSION_ID
        ;;
    "Change wallpaper")
        hyprctl dispatch exec "$HOME/.config/hypr/scripts/wallpaper_switch.sh"
        ;;
    "Waybar Profile")
        hyprctl dispatch exec "$HOME/.config/hypr/scripts/waybar_profile.sh"
        ;;
esac
