<h1 align=center>Hyprland + Arch config</h1>

> A simple Hyprland config with adaptive color scheme, packed with just the bare minimum to keep you away from all the useless "improved quality of life" shenanigans.

## Preview

![preview1](./assets/preview1.png)
![preview2](./assets/preview2.png)
![preview4](./assets/preview4.png)
![preview3](./assets/preview3.png)
![preview5](./assets/preview5.png)

## Info
- **TWC**: Hyprland
- **Editor**: Neovim
- **Fetch**: fastfetch
- **Launcher**: Fuzzel
- **Lockscreen**: hyprlock
- **Color scheme generator**: pywal
- **Fonts**: JetBrains Mono Nerd Font, FiraCode Nerd Font
- **Music Player**: Tauon Music Box

## Notes
- There are 2 styles of waybar to use: bottom & top. To choose which bar to use, change the `-s` and `-c` of waybar execution command in `~/.config/hypr/autostart/autostart.conf`.

## Create `change_wallpaper.sh` symbolic link
```bash
cd ~ & \
cp .config/change_wallpaper.sh change_wallpaper.sh && ln -s .config/change_wallpaper.sh change_wallpaper.sh
```
Grant permission to execute
```bash
chmod +x change_wallpaper
```
### How to use
In home directory, run:
```bash
./change_wallpaper.sh
```
Wallpaper directory can be modified in the script. By default is set to `~/Pictures/wallpapers/`

## Shortcuts
| Keybind | Action |
| --- | --- |
|Super| Open Launcher|
|Super + Q| Close window|
|Super + P| Power Menu|
|Super + R| Quick run commands|
|Super + X| Open terminal|
|Super + L| Lock|
|Super + W| Web browser|
|Super + E| File manager|
|Super + V| Clipboard|
|Super + T| Toggle floating window|
|Super + M| Logout|
|Super + Shift + Q| Toggle window split direction|
|Super + Shift + S| Regional screenshot|
|Super + Shift + F| Toggle fullscreen|
|Print| Full screenshot|
|Super + Shift + T| Toggle touchpad (remember to change your touchpad device name) |
|Super + LMB| Reposition|
|Super + RMB| Resize|
|Super + L_Ctrl + Shift + Backspace| Shutdown|
|Super + 0-9| Switch workspace|
|Super + Shift + 0-9| Move window to workspace|
|Super + arrow keys| Move focus|
|ALT + TAB| Next workspace|
|ALT + Shift + TAB| Previous workspace|
|XF86 controls keys| Volume, brightness, etc|

## Additional steps
Grant execute permission to scripts in `~/.config/hypr/scripts/`
```bash
chmod +x ~/.config/hypr/scripts/<filename>
```
