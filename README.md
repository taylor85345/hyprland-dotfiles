# Garden

## Packages

```
WM          : Hyprland
terminal    : foot
bar         : eww
launcher    : fuzzel
file manager: Dolphin
```

## Screenshot


https://user-images.githubusercontent.com/36456160/170814674-50c49874-5fd7-419c-ae05-3891adfe2daa.mp4


## Dependencies

- [hyprland-git](https://github.com/vaxerski/hyprland) - Wayland Compositor/WM
- [eww](https://github.com/elkowar/eww) - Bar and Widgets
- [nerd-fonts-inter](https://github.com/rsms/inter) - Font for bar text and icons
- [fuzzel](https://codeberg.org/dnkl/fuzzel) - Rofi-like launcher
- [rofi](https://github.com/davatorium/rofi) - For search utility, since no Wayland utilities can handle custom Rofi modi (that I know of)
- [mako](https://github.com/emersion/mako) - Notification Daemon
- [trayer](https://github.com/sargon/trayer-srg) - Systray Utility
- [mpvpaper](https://github.com/GhostNaN/mpvpaper) - Video Backgrounds
- [macchina](https://github.com/Macchina-CLI/macchina) - (Optional) Fetch Script

## Installation

These instructions assume an Arch Linux-based distribution. Hyprland is not present in repositories for other Linux distribution as of this writing, and availability of other dependencies may vary. If a package is unavailable on your distribution, please see the links in the Dependencies section to the various repositories for each dependency, and follow the relevant instructions to install manually.

1. Install an AUR Helper (if necessary): 
 
     ```bash
     sudo pacman -S base-devel git
     git clone https://aur.archlinux.org/yay
     cd yay
     makepkg -si
     ```

2. Install all required dependencies

    `yay -S hyprland-git eww fuzzel rofi mako trayer mpvpaper macchina nerd-fonts-inter`

3. Clone the repository

    `git clone https://github.com/taylor85345/garden-hyprland-dotfiles.git`

4. Copy dotfiles into your config directory (assumptions made).

    `cp -ri garden-hyprland-dotfiles/* $HOME/.config/`

## Configuration

   + **Default Apps script**
   
     I've included the default_app script, which assigns a program to each workspace and opens the appropriate application for the focused workspace. Edit the script with your preferred application for each workspace. This is called with the SUPER+SHIFT+ENTER keybind, or by right-clicking on the appropriate workspace icon in the bar.
    
     **Known issue:** this script currently will not work if more than one monitor is active, as hyprctl does not provide a way to identify the focused monitor.

  + **Application Theming**
    
    For consistency, I use the following themes in GTK and QT apps:
    
    - QT5/Kvantum: [Inverse-dark](https://github.com/yeyushengfan258/Inverse-dark-kde)
    - GTK: [gtk-theme-breath](https://github.com/manjaro/artwork-breath-gtk)

    I highly recommend using QT5 applications with this theme, particularly those made for the KDE desktop environment, and applying the Inverse-dark theme via `qt5ct` and `kvantum-manager`.
  
  + **Fetch Script**
    
    If you want to use my fetch script, you will need to install [Macchina](https://github.com/Macchina-CLI/macchina) and add `macchina` to your shell config:

    ```BASH
    macchina
    ```

## Tips
  
  + **Keybinds**
    
    `SUPER + LEFTMOUSE` - Drag to move windows
    
    `SUPER + RIGHTMOUSE` - Drag to resize windows
    
    `SUPER + ENTER` - Open Terminal (foot)
    
    `SUPER + SHIFT + ENTER` - Open default application for focused workspace (see hypr/default_apps script)
    
    `SUPER + (1-9)` - Switch to Workspace (1-9)
    
    `SUPER + SHIFT + (1-9)` - Move active window to Workspace (1-9)
    
    `SUPER + (LEFT,DOWN,UP,RIGHT or HJKL)` - Move window focus within workspace
    
    `SUPER + SHIFT + (LEFT,DOWN,UP,RIGHT or H,J,K,L)` - Move window within tiling layout
    
    `SUPER + SHIFT + (LEFT,DOWN,UP,RIGHT or H,J,K,L)` - Move window within tiling layout
    
    `SUPER + CTRL + (LEFT,RIGHT or H,L)` - Move to Previous/Next Workspace
    
    `SUPER + D` - Open Application Launcher (fuzzel)
    
    `SUPER + Q` - Kill current window
    
    `SUPER + SHIFT + Q` - Kill Hyprland
    
    `SUPER + S` - Toggle Tiling/Floating Window
    
    `SUPER + SHIFT + R` - Force reload of hyprland.cfg
    
    `SUPER + [ALT] + T` - Open or [Kill] Trayer
    
    `SUPER + [ALT] + B` - Open or [Kill] Bar
    
    `SUPER + [ALT] + F12` - Enable or [Disable] Background Blur (Helps FPS in Games)
    
    `SUPER + SPACE` - Launch Rofi File Browser Module 
    
    This covers the basics. See the Binds section of hyprland.conf for all configured keybinds.
