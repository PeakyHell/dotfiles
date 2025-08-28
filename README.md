# dotfiles

# Files
- Arch/ : Config files for Arch Linux
- Common/ : Config files both for Arch Linux and MacOs
- Docs/ : Documentations, guides, ...
- MacOs/ : Config files for MacOs
- Scripts/ : Config scripts

# Arch Linux Installation

NEEDS UPDATE

1. Read the [Arch installation guide](installation/arch_install.md)
2. Read the [Hyprland installation guide](installation/hyprland_install.md)
3. Read the [Environment configuration guide](installation/configuration.md)

# Arch Linux Packages (58)

## Pacman (55)

| Name | Description | Needs config |
|------|-------------|--------------|
| amd-ucode | Microcode updates for amd CPU | No |
| base | Used to define a basic Arch Linux installation | No |
| base-devel | Base development packages  | No |
| discord | Discord | No |
| dunst | Notification daemon | `exec-once` in Hyprland config |
| efibootmgr | Used by grub to write boot entries to NVRAM | No |
| egl-wayland | Enables compatibility between the EGL API and the Wayland protocol | No |
| fastfetch | Terminal tool to show system informations | No |
| git | Version control | Config file in the repo |
| grub | Bootloader | During installation |
| hypridle | Idling in Hyprland | `exec-once` in Hyprland config and Config file in repo |
| hyprland | Dynamic tiling Wayland compositor | Config file in repo and instructions in the [Hyprland installation guide](installation/hyprland_install.md) |
| hyprlock | Lock screen for Hyprland | `bind` in Hyprland config and Config file in repo |
| hyprpaper | Wallpaper manager | `exec-once` in Hyprland config and Config file in repo + wallpapers|
| hyprpolkitagent | Authentication agent | `exec-once` in Hyprland config |
| kitty | Terminal emulator | No |
| lib32-nvidia-utils | Utilities for 32 bits games | No |
| libva-nvidia-driver | Driver for Hardware Acceleration | `env` in Hyprland config |
| linux | Linux kernel | No |
| linux-firmware | Linux firmware | No |
| man-db | Man pages reader | No |
| man-pages | Linux man pages | No |
| neovim | NeoVim text editor | Config file in the repo |
| networkmanager | Provides configuration for network interfaces | Needs to be enabled |
| noto-fonts | Noto fonts | No |
| nvidia-open | Nvidia driver | No |
| nvidia-utils | Nvidia drivers utilities | No |
| openssh | Ssh usage and key management | Config file in the repo |
| pavucontrol | Audio control | No |
| pipewire | Multimedia framework. Required for screensharing | No |
| pipewire-pulse | Audio/Video router and processor | No |
| prismlauncher | Minecraft Launcher | No |
| qt5-wayland | Enables Wayland support in Qt | No |
| qt6-wayland | Enables Wayland support in Qt | No |
| reflector | Used to retrieve Pacman mirror list | No |
| sddm | The display manager | No |
| spotify-launcher | Spotify | No |
| steam | Steam | No |
| sudo | Give permissions to users | No |
| texinfo | GNU documentation | No |
| ttf-nerd-fonts-symbols-common | Extra symbol | No |
| ttf-noto-nerd | Noto nerd font | No |
| ufw | Uncomplicated firewall | Instructions in the [Environment configuration guide](installation/configuration.md) |
| waybar | Wayland bar | `exec-once` in Hyprland config and Config file in repo |
| wayland-protocols | Add Wayland protocols not included in the core protocol | No |
| wireplumber | Session and policy manager for pipewire | No |
| wl-clipboard | Clipboard tool for Wayland | No |
| wofi | Applications launcher | ? |
| xclip | Clipboard tool for X11 | No |
| xdg-desktop-portal-gtk | File picker for XDPH | TODO : With xdg-desktop-portal-hyprland |
| xdg-desktop-portal-hyprland | Allow apps to communicate with the compositor through D-Bus | TODO: `exec-once` in Hyprland config |
| xorg-xwayland | Allows to run X apps in Wayland | No |
| zsh | The zsh shell | Config file in the repo |
| zsh-autosuggestions | Automatically suggest commands for zsh | No |
| zsh-completions | Zsh tab completion | No |

## Yay (3)

| Name | Description | Needs config |
|------|-------------|--------------|
| goxlr-utility | GoXLR app for Linux | No |
| librewolf-bin | Web Browser | No |
| yay | AUR Helper | Packages to install listed in the repo |

# MacOs Packages (16)

## Formulaes (8)

| Name | Description | Needs config |
|------|-------------|--------------|
| fastfetch | Terminal tool to show system informations | No |
| gcc | Compiler | No |
| git | Version control | Config file in the repo |
| neovim | NeoVim text editor | Config file in the repo |
| node | Javascript environment | No |
| openjdk | Java JDK | No |
| python | Python | No |
| xclip | Clipboard tool for X11 | No |

## Casks (8)

| Name | Description | Needs config |
|------|-------------|--------------|
| discord | Discord | No |
| docker-desktop | Containering | No |
| kitty | Terminal emulator | No |
| librewolf | Web Browser | No |
| obsidian | Note taking | No |
| protonvpn | VPN | No |
| scroll-reverser | Reverse trackpad and mouse scroll direction | No |
| spotify | Spotify | No |
