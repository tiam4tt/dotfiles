<h1 align=center>I call this "HyprArch"</h1>

> A simple Hyprland config with adaptive color scheme, packed with just the bare minimum to keep you away from all the "improved quality of life" shenanigans.

## Preview

![preview1](./assets/preview1.png)
![preview2](./assets/preview2.png)
![preview3](./assets/preview3.png)

## Specs
- **WM**: Hyprland
- **Editor**: Neovim
- **Fetch**: fastfetch
- **Launcher**: Fuzzel
- **Lockscreen**: hyprlock
- **Color scheme generator**: pywal
- **Fonts**: JetBrains Mono Nerd Font, FiraCode Nerd Font

## Create `change_wallpaper.sh` symbolic link
```bash
cp .config/change_wallpaper.sh change_wallpaper.sh && ln -s .config/change_wallpaper.sh change_wallpaper.sh
```

### How to use
```bash
./change_wallpaper.sh
```
Wallpaper directory can be modified in the script. By default is set to `~/Pictures/wallpapers/`

## Shortcuts
| Keybind | Action |
| --- | --- |
|Super| Open Launcher|
|Super + C| Close window|
|Super + X| Open terminal|
|Super + L| Lock|
|Super + W| Web browser (Firefox)|
|Super + E| File manager (dolphin)|
|Super + V| Clipboard|
|Super + T| Toggle floating window|
|Super + Shift + Q| Toggle window split direction|
|Super + Shift + S| Regional screenshot|
|Print| Full screenshot|
|Super + LMB| Reposition|
|Super + RMB| Resize|
|Super + L_Ctrl + Shift + Backspace| Shutdown|
|Super + 0-9| Switch workspace|
|Super + Shift + 0-9| Move window to workspace|
