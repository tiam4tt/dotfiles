menu=("Topbar" "Bottombar")
choice=$(printf "%s\n" "${menu[@]}" | fuzzel --dmenu -i -p "Waybar Profile: ")

case $choice in
    Topbar)
      pkill waybar
      hyprctl dispatch exec "waybar -c $HOME/.config/waybar/topbar/config.jsonc -s $HOME/.config/waybar/topbar/style.css"
        ;;
    Bottombar)
      pkill waybar
      hyprctl dispatch exec "waybar -c $HOME/.config/waybar/bottombar/config.jsonc -s $HOME/.config/waybar/bottombar/style.css"
        ;;
esac
