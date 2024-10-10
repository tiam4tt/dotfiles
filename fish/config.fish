
set -Ux fish_user_paths $HOME/.local/bin $fish_user_paths

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/tiamatt/miniconda3/bin/conda
    eval /home/tiamatt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/tiamatt/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/tiamatt/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/tiamatt/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

