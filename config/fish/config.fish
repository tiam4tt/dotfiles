set -Ux fish_user_paths $HOME/.local/bin $fish_user_paths
set -Ux XDG_SESSION_TYPE wayland
set -Ux VISUAL nvim
set -Ux QT_QPA_PLATFORM wayland
set -gx PATH (string match -v '/home/tiamatt/miniconda3/bin' $PATH)
# starship init fish | source
