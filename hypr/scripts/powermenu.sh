#!/bin/bash

menu=("Shutdown" "Reboot" "Suspend" "Lock" "Logout" "AC/BAT Refresh Rate" "Change wallpaper" "Waybar Profile")

choice=$(printf "%s\n" "${menu[@]}" | fuzzel  --dmenu -i -p "Power Menu: ")

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
    "AC/BAT Refresh Rate")
        hyprctl dispatch exec "$HOME/.config/hypr/scripts/refreshrate_switch.sh"
        ;;
    "Change wallpaper")
        dark_light=("Dark" "Light")
        theme=$(printf "%s\n" "${dark_light[@]}" | fuzzel --dmenu -i -p "Theme: ")
        hyprctl dispatch exec "$HOME/.config/hypr/scripts/wallpaper_switch.sh" $theme
        ;;
    "Waybar Profile")
        hyprctl dispatch exec "$HOME/.config/hypr/scripts/waybar_profile.sh"
        ;;
esac
