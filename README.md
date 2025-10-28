# dotfiles

# Files
- Arch/ : Config files for Arch Linux
    - etc/
        - Dunst
        - Pacman
        - Sddm
    - home/.config/
        - Conky
        - Hypr*
        - Wallpapers
        - Waybar
        - Wofi
- Common/ : Config files both for Arch Linux and MacOs
    - home/
        - Kitty
        - Neovim
        - Ssh
        - Git
        - Zsh
- Docs/ : Documentations, guides, ...
- MacOs/ : Config files for MacOs
- Scripts/ : Config scripts
- Windows/ : Config files for Windows

# Arch Linux Installation

1. Read the [Arch installation guide](Docs/arch_install.md)

# Arch Linux Packages (60)

View [Arch Packages Config](Docs/arch_packages_config.md) for configuration instructions.

## Pacman (57)

| Name                        | Description                                                        |
|-----------------------------|--------------------------------------------------------------------|
| amd-ucode                   | Microcode updates for amd CPU                                      |
| base                        | Used to define a basic Arch Linux installation                     |
| base-devel                  | Base development packages                                          |
| conky                       | System Monitoring                                                  |
| discord                     | Discord                                                            |
| dunst                       | Notification daemon                                                |
| efibootmgr                  | Used by grub to write boot entries to NVRAM                        |
| egl-wayland                 | Enables compatibility between the EGL API and the Wayland protocol |
| fastfetch                   | Terminal tool to show system informations                          |
| git                         | Version control                                                    |
| grub                        | Bootloader                                                         |
| hypridle                    | Idling in Hyprland                                                 |
| hyprland                    | Dynamic tiling Wayland compositor                                  |
| hyprlock                    | Lock screen for Hyprland                                           |
| hyprpaper                   | Wallpaper manager                                                  |
| hyprpolkitagent             | Authentication agent                                               |
| kitty                       | Terminal emulator                                                  |
| lib32-nvidia-utils          | Utilities for 32 bits games                                        |
| libva-nvidia-driver         | Driver for Hardware Acceleration                                   |
| linux                       | Linux kernel                                                       |
| linux-firmware              | Linux firmware                                                     |
| man-db                      | Man pages reader                                                   |
| man-pages                   | Linux man pages                                                    |
| neovim                      | NeoVim text editor                                                 |
| networkmanager              | Provides configuration for network interfaces                      |
| noto-fonts                  | Noto fonts                                                         |
| nvidia-open                 | Nvidia driver                                                      |
| nvidia-utils                | Nvidia drivers utilities                                           |
| openssh                     | Ssh usage and key management                                       |
| pavucontrol                 | Audio control                                                      |
| pipewire                    | Multimedia framework. Required for screensharing                   |
| pipewire-pulse              | Audio/Video router and processor                                   |
| prismlauncher               | Minecraft Launcher                                                 |
| proton-vpn-gtk-app          | ProtonVPN                                                          |
| qt5-wayland                 | Enables Wayland support in Qt                                      |
| qt6-wayland                 | Enables Wayland support in Qt                                      |
| reflector                   | Used to retrieve Pacman mirror list                                |
| sddm                        | The display manager                                                |
| spotify-launcher            | Spotify                                                            |
| steam                       | Steam                                                              |
| sudo                        | Give permissions to users                                          |
| texinfo                     | GNU documentation                                                  |
| ttf-nerd-fonts-symbols      | Extra symbols                                                      |
| ttf-noto-nerd               | Noto nerd font                                                     |
| ufw                         | Uncomplicated firewall                                             |
| waybar                      | Wayland bar                                                        |
| wayland-protocols           | Add Wayland protocols not included in the core protocol            |
| wireplumber                 | Session and policy manager for pipewire                            |
| wl-clipboard                | Clipboard tool for Wayland                                         |
| wofi                        | Applications launcher                                              |
| xclip                       | Clipboard tool for X11                                             |
| xdg-desktop-portal-gtk      | File picker for XDPH                                               |
| xdg-desktop-portal-hyprland | Allow apps to communicate with the compositor through D-Bus        |
| xorg-xwayland               | Allows to run X apps in Wayland                                    |
| zsh                         | The zsh shell                                                      |
| zsh-autosuggestions         | Automatically suggest commands for zsh                             |
| zsh-completions             | Zsh tab completion                                                 |

## Yay (3)

| Name          | Description         |
|---------------|---------------------|
| goxlr-utility | GoXLR app for Linux |
| librewolf-bin | Web Browser         |
| yay           | AUR Helper          |

# MacOs Packages (16)

View [MacOs Packages Config](Docs/macos_packages_config.md) for configuration instructions.

## Formulaes (8)

| Name      | Description                               |
|-----------|-------------------------------------------|
| fastfetch | Terminal tool to show system informations |
| gcc       | Compiler                                  |
| git       | Version control                           |
| neovim    | NeoVim text editor                        |
| node      | Javascript environment                    |
| openjdk   | Java JDK                                  |
| python    | Python                                    |
| xclip     | Clipboard tool for X11                    |

## Casks (8)

| Name            | Description                                 |
|-----------------|---------------------------------------------|
| discord         | Discord                                     |
| docker-desktop  | Containering                                |
| kitty           | Terminal emulator                           |
| librewolf       | Web Browser                                 |
| obsidian        | Note taking                                 |
| protonvpn       | VPN                                         |
| scroll-reverser | Reverse trackpad and mouse scroll direction |
| spotify         | Spotify                                     |

# Windows Packages (9)

## Chocolatey (3)

| Name       | Description                           |
|------------|---------------------------------------|
| librewolf  | Web Browser                           |
| nvidia-app | Nvidia Drivers and Games optimization |
| spotify    | Spotify                               |

## Apps (6)

| Name                    | Description                        |
|-------------------------|------------------------------------|
| Discord                 | Discord                            |
| GoXLR App + Driver      | GoXLR Mini's App + Drivers         |
| Logitech GHUB           | Logitech Peripherals Customization |
| Riot Games Client       | Riot Games Client                  |
| Rockstar Games Launcher | Rockstar Games Launcher            |
| Steam                   | Steam                              |
