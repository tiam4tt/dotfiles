<h1 align=center>Hyprland + Arch config</h1>


<div align="center">

![](https://img.shields.io/github/last-commit/tiam4tt/dotfiles?style=for-the-badge&labelColor=11111b&color=b4befe)
![](https://img.shields.io/github/repo-size/tiam4tt/dotfiles?style=for-the-badge&labelColor=11111b&color=94e2d5)
</div>

# Sections

> [Preview](#preview)
>
> [Info](#info)
>
> [Grant execute permission to scripts in `~/.config/hypr/scripts/`](#grant-execute-permission-to-scripts-in-confighyprscripts)
>
> [Keybinds](#keybinds)

## Preview

![preview1](./assets/preview1.png)
![preview2](./assets/preview2.png)
![preview3](./assets/preview3.png)
![preview4](./assets/preview4.png)
![preview4](./assets/preview5.png)

## Info
|**Specification**|**Detail**|
|:------|:-------|
|**OS**| Arch Linux|
|**WM** | Hyprland|
|**Editor**| Neovim|
|**Browser**| Firefox|
|**File Manager**| dolphin|
|**Fetch**| fastfetch|
|**Launcher**| rofi|
|**Terminal**| Alacritty|
|**Shell**| Fish|
|**Notification**| fnott|
|**Lockscreen**| hyprlock|
|**Color scheme generator**| pywal|
|**Fonts**| JetBrains Mono Nerd Font, FiraCode Nerd Font, Blex Mono Nerd Font|
|**Music Player**| Tauon Music Box|

## Grant execute permission to scripts in `~/.config/hypr/scripts/`

In case the scripts are not executable, `chmod` them.

```bash
chmod +x $HOME/.config/hypr/scripts/*
```
Wallpaper directory by default points to `~/Pictures/wallpapers/`

## Keybinds
| Label | Action |
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
|Super + Shift + T| Toggle touchpad|
|Super + Shift + Q| Toggle window split direction|
|Super + Shift + F| Toggle fullscreen|
|Super + Shift + S| Regional screenshot|
|Print| Full screenshot|
|Super + LMB| Reposition|
|Super + RMB| Resize|
|Super + L_Ctrl + Shift + Backspace| Shutdown|
|Super + 0-9| Switch workspace|
|Super + Shift + 0-9| Move window to workspace|
|Super + arrow keys| Move focus|
|ALT + TAB| Next workspace|
|ALT + Shift + TAB| Previous workspace|
|XF86 controls keys| Volume, brightness, etc|
