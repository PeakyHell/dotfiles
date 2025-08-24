# dotfiles

# Files

- installation/
    - arch_install.md : Basic Arch installation tutorial with very basic configuration
    - configuration.md : Packages and environment configuration
    - hyprland_install.md : Hyprland installation and configuration
- nvim/
    - init.lua : Neovim configuration
    - lazy-lock.json : LazyVim plugins
- .gitconfig : Git global configuration
- .zshrc : Zsh configuration
- Brewfile : Homebrew packages for MacOs
- hyprland.conf : Hyprland configuration
- pacman.txt : Pacman packages
- yay.txt : Yay packages

# Arch Linux Installation

1. Read the [Arch installation guide](installation/arch_install.md)
2. Read the [Hyprland installation guide](installation/hyprland_install.md)
3. Read the [Environment configuration guide](installation/configuration.md)

# Packages (54)

## System packages (18)

| Name | Description | Needs config |
|------|-------------|--------------|
| amd-ucode | Microcode updates for amd CPU | No |
| base | Used to define a basic Arch Linux installation | No |
| base-devel | Base development packages  | No |
| efibootmgr | Used by grub to write boot entries to NVRAM | No |
| grub | Bootloader | During installation |
| lib32-nvidia-utils | Utilities for 32 bits games | No |
| linux | Linux kernel | No |
| linux-firmware | Linux firmware | No |
| networkmanager | Provides configuration for network interfaces | Needs to be enabled |
| nvidia-open | Nvidia driver | No |
| nvidia-utils | Nvidia drivers utilities | No |
| pipewire | Multimedia framework. Required for screensharing | No |
| pipewire-pulse | Audio/Video router and processor | No |
| sddm | The display manager | No |
| sudo | Give permissions to users | No |
| ufw | Uncomplicated firewall | Instructions in the [Environment configuration guide](installation/configuration.md) |
| wireplumber | Session and policy manager for pipewire | No |
| zsh | The zsh shell | Config file in the repo |

## Hyprland (16)

| Name | Description | Needs config |
|------|-------------|--------------|
| dunst | Notification daemon | ? |
| egl-wayland | Enables compatibility between the EGL API and the Wayland protocol | No |
| hyprland | Dynamic tiling Wayland compositor | Config file in repo and instructions in the [Hyprland installation guide](installation/hyprland_install.md) |
| hyprpolkitagent | Authentication agent | No |
| libva-nvidia-driver | Driver for Hardware Acceleration | No |
| noto-fonts | Noto fonts | No |
| qt5-wayland | Enables Wayland support in Qt | No |
| qt6-wayland | Enables Wayland support in Qt | No |
| ttf-nerd-fonts-symbols-common | Extra symbol | No |
| ttf-noto-nerd | Noto nerd font | No |
| waybar | Wayland bar | Config file in repo |
| wayland-protocols | Add Wayland protocols not included in the core protocol | No |
| wofi | Applications launcher | ? |
| xdg-desktop-portal-gtk | File picker for XDPH | No |
| xdg-desktop-portal-hyprland | Allow apps to communicate with the compositor through D-Bus | No |
| xorg-xwayland | Allows to run X apps in Wayland | No |

## Apps / Utils (20)

| Name | Description |
|------|-------------|
| discord | Discord | No |
| fastfetch | Terminal tool to show system informations | No |
| firefox | Web Browser | No |
| git | Version control | Config file in the repo |
| goxlr-utility | GoXLR app for Linux | No |
| kitty | Terminal emulator | No |
| man-db | Man pages reader | No |
| man-pages | Linux man pages | No |
| neovim | NeoVim text editor | Config file in the repo |
| openssh | Ssh usage and key management | Config file in the repo |
| pavucontrol | Audio control | No |
| reflector | Used to retrieve Pacman mirror list | No |
| spotify-launcher | Spotify | No |
| steam | Steam | No |
| texinfo | GNU documentation | No |
| wl-clipboard | Clipboard tool for Wayland | No |
| xclip | Clipboard tool for X11 | No |
| yay | AUR Helper | Packages to install listed in the repo |
| zsh-autosuggestions | Automatically suggest commands for zsh | No |
| zsh-completions | Zsh tab completion | No |
