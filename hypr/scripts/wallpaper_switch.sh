#!/bin/bash

wallpaper_dir=$HOME/Pictures/wallpapers
menu=$(ls $wallpaper_dir)
choice=$(printf "%s\n" "${menu[@]}" | fuzzel --dmenu -i -p "Wallpaper: ")

if [ -z $choice]; then
    exit 1
fi

content="preload = $wallpaper_dir/$choice\nwallpaper = ,$wallpaper_dir/$choice"

echo -e $content > $HOME/.config/hypr/hyprpaper.conf

wal -s -t -i "$wallpaper_dir/$choice"

cp -rf $HOME/.cache/wal/colors-waybar.css $HOME/.config/waybar/topbar

pkill dunst
pkill hyprpaper && hyprctl -q dispatch exec hyprpaper

hyprctl -q reload
