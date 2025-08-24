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

# Packages

## System packages

| Name | Description |
|------|-------------|
| amd-ucode | Microcode updates for amd CPU |
| base | Used to define a basic Arch Linux installation |
| base-devel | Base development packages  |
| efibootmgr | Used by grub to write boot entries to NVRAM |
| grub | Bootloader |
| lib32-nvidia-utils | Utilities for 32 bits games |
| linux | Linux kernel |
| linux-firmware | Linux firmware |
| networkmanager | Provides configuration for network interfaces |
| nvidia-open | Nvidia driver |
| nvidia-utils | Nvidia drivers utilities |
| pipewire | Multimedia framework. Required for screensharing |
| pipewire-pulse | Audio/Video router and processor |
| sddm | The display manager |
| sof-firmware | Firmware for audio cards |
| sudo | Give permissions to users |
| ufw | Uncomplicated firewall |
| wireplumber | Session and policy manager for pipewire |
| zsh | The zsh shell |

## Hyprland

| Name | Description |
|------|-------------|
| dunst | Notification daemon |
| egl-wayland | Enables compatibility between the EGL API and the Wayland protocol |
| hyprland | Dynamic tiling Wayland compositor |
| hyprpolkitagent | Authentication agent |
| libva-nvidia-driver | Driver for Hardware Acceleration |
| noto-fonts | Noto fonts |
| qt5-wayland | Enables Wayland support in Qt |
| qt6-wayland | Enables Wayland support in Qt |
| ttf-nerd-fonts-symbols-common | Extra symbol |
| ttf-noto-nerd | Noto nerd font |
| waybar | Wayland bar |
| wayland-protocols | Add Wayland protocols not included in the core protocol |
| wofi | Applications launcher |
| xdg-desktop-portal-gtk | File picker for XDPH |
| xdg-desktop-portal-hyprland | Allow apps to communicate with the compositor through D-Bus |
| xorg-xwayland | Allows to run X apps in Wayland |

## Apps / Utils

| Name | Description |
|------|-------------|
| discord | Discord |
| fastfetch | Terminal tool to show system informations |
| firefox | Web Browser |
| git | Version control |
| goxlr-utility | GoXLR app for Linux |
| kitty | Terminal emulator |
| man-db | Man pages reader |
| man-pages | Linux man pages |
| neovim | NeoVim text editor |
| openssh | Ssh usage and key management |
| pavucontrol | Audio control |
| reflector | Used to retrieve Pacman mirror list |
| steam | Steam |
| texinfo | GNU documentation |
| xclip | Clipboard tool |
| yay | AUR Helper |
| zsh-autosuggestions | Automatically suggest commands for zsh |
| zsh-completions | Zsh tab completion |
