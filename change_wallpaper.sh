#!/bin/sh
#change your wallpaper directory here
wallpaper_dir="~/Pictures/wallpapers"

read_wallpaper_path(){
  check_path="${wallpaper_dir#"~/"}"
  if [[ -d "$check_path" ]]; then
    ls "$check_path"
  else
    echo "Error: Path not found."
    exit 1
  fi

  echo ""
  read -p "Choose the wallpaper file name: " wallpaper_name

  wallpaper_path="$wallpaper_dir/$wallpaper_name"

  check_path="${wallpaper_path#"~/"}"
  echo ""
  if [[ -f "$check_path" ]]; then
    echo -e "Wallpaper path found!"

  else
    echo "Error: Wallpaper file not found."
    exit 1
  fi
}

message=(
"----------CURRENT WALLPAPER DIRECTORY--------------

>> $wallpaper_dir

----------------------------------------------------"
)

echo -e "$message"

read_wallpaper_path

#---------------COMMANDS-----------------#
# hyprpaper
content="preload = $wallpaper_path\nwallpaper = ,$wallpaper_path"
cd ~
echo -n -e "$content" > .config/hypr/hyprpaper.conf
# generate colorscheme
walpath="${wallpaper_path#'~/'}"
wal -i "$walpath"

# update waybar
cp -rf ~/.cache/wal/colors-waybar.css ~/.config/waybar/

# update joshuto
cp -rf ~/.cache/wal/theme.toml ~/.config/joshuto/theme.toml

echo ""
echo "A L L   D O N E !"

read -p "Clear the terminal? (Y/n):" clear_terminal
if [[ "$clear_terminal" == "Y" || "$clear_terminal" == "y" ]]; then
  clear
fi

# reload
pkill dunst
hyprctl -q reload
pkill hyprpaper && hyprctl -q dispatch exec hyprpaper
