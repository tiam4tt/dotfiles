#!/bin/bash
clear

if [[ -f ~/.last_session_apps ]]; then
    echo "Restoring session..."
    while IFS=$'\t' read -r app workspace monitor; do
        app_lower=$(echo "$app" | tr '[:upper:]' '[:lower:]')
        case "$app_lower" in
          firefox) nohup firefox >/dev/null 2>&1 & ;;
          discord) nohup discord >/dev/null 2>&1 & ;;
          code) nohup code >/dev/null 2>&1 & ;;
          spotify) nohup spotify >/dev/null 2>&1 & ;;
          alacritty) nohup alacritty >/dev/null 2>&1 & ;;
          obsidian) nohup obsidian >/dev/null 2>&1 & ;;
          *) nohup "$app_lower" >/dev/null 2>&1 & ;;
        esac

        for i in {1..10}; do
            if hyprctl -j clients | jq -e ".[] | select((.class|ascii_downcase)==\"$app_lower\")" >/dev/null; then
                hyprctl dispatch movetoworkspace "$workspace"
                break
            fi
            sleep 1
        done
    done < ~/.last_session_apps
fi

systemctl --user start log-session.service