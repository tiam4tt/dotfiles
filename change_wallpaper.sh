#!/bin/bash
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
    echo -e "\nWallpaper path found!" 

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
hyprctl hyprpaper preload "$wallpaper_path"
hyprctl hyprpaper wallpaper ",$wallpaper_path"

# generate colorscheme
walpath="${wallpaper_path#'~/'}"
wal -s -t -i "$walpath"

# update waybar
cp -rf ~/.cache/wal/colors-waybar.css ~/.config/waybar/

# update joshuto
cp -rf ~/.cache/wal/theme.toml ~/.config/joshuto/theme.toml

#change dunstrc
cp -rf ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc

# reload
pkill waybar & hyprctl dispatch exec waybar
pkill hyprpaper; hyprctl dispatch exec hyprpaper
hyprctl reload
