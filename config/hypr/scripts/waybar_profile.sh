#!/bin/bash

CONFIG_DIR="$HOME/.config/waybar"
AUTOSTART_CONF="$HOME/.config/hypr/autostart/bar_profile.conf"

menu_entries=()
declare -A config_map
declare -A style_map

# Topbar
for cfg in "$CONFIG_DIR"/topbar/config*.jsonc; do
    cfg_base=$(basename "$cfg" .jsonc)
    number="${cfg_base#config}"
    [[ -z "$number" ]] && number=1
    label="Topbar: $number"

    style="$CONFIG_DIR/topbar/style${number}.css"
    [[ ! -f "$style" ]] && style="$CONFIG_DIR/topbar/style.css"

    menu_entries+=("$label $number")
    config_map["$label"]="$cfg"
    style_map["$label"]="$style"
done

# Bottombar
for cfg in "$CONFIG_DIR"/bottombar/config*.jsonc; do
    cfg_base=$(basename "$cfg" .jsonc)
    number="${cfg_base#config}"
    [[ -z "$number" ]] && number=1
    label="Bottombar: $number"

    style="$CONFIG_DIR/bottombar/style${number}.css"
    [[ ! -f "$style" ]] && style="$CONFIG_DIR/bottombar/style.css"

    menu_entries+=("$label $number")
    config_map["$label"]="$cfg"
    style_map["$label"]="$style"
done

# Sort entries numerically
sorted_menu=$(printf "%s\n" "${menu_entries[@]}" | sort -t':' -k1,1 -k2n | cut -d' ' -f1-2)

# Rofi selection
choice=$(printf "%s\n" "$sorted_menu" | rofi -dmenu -i -p "Waybar Profile: ")

[[ -z "$choice" ]] && exit 1

# Kill existing Waybar
pkill -x waybar

# Launch selected profile
config="${config_map[$choice]}"
style="${style_map[$choice]}"

echo "exec = pkill waybar; waybar -c $config -s $style" > "$AUTOSTART_CONF"
