menu=("Shutdown" "Reboot" "Suspend" "Lock" "Logout")

choice=$(printf "%s\n" "${menu[@]}" | fuzzel --lines 5 --dmenu -i -p "Power Menu: ")

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
esac
