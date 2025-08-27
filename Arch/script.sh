#!/bin/zsh


packages=(
    "amd-ucode"
    "base"
    "base-devel"
    "discord"
    "dunst"
    "efibootmgr"
    "egl-wayland"
    "fastfetch"
    "firefox"
    "git"
    "goxlr-utility"
    "grub"
    "hypridle"
    "hyprland"
    "hyprlock"
    "hyprpaper"
    "hyprpolkitagent"
    "kitty"
    "lib32-nvidia-utils"
    "libva-nvidia-driver"
    "linux"
    "linux-firmware"
    "man-db"
    "man-pages"
    "neovim"
    "networkmanager"
    "noto-fonts"
    "nvidia-open"
    "nvidia-utils"
    "openssh"
    "pavucontrol"
    "pipewire"
    "pipewire-pulse"
    "qt5-wayland"
    "qt6-wayland"
    "reflector"
    "sddm"
    "spotify-launcher"
    "steam"
    "sudo"
    "texinfo"
    "ttf-nerd-fonts-symbols-common"
    "ttf-noto-nerd"
    "ufw"
    "waybar"
    "wayland-protocols"
    "wireplumber"
    "wl-clipboard"
    "wofi"
    "xclip"
    "xdg-desktop-portal-gtk"
    "xdg-desktop-portal-hyprland"
    "xorg-xwayland"
    "yay"
    "zsh"
    "zsh-autosuggestions"
    "zsh-completions"
)
yay=(

)


while true; do


clear
echo "=========================================="
echo "    Choose an option :"
echo "    [1] Install/Update Pacman packages"
echo "    [2] Update config files"
echo "    [0] Exit"
echo "=========================================="

read option


case "$option" in

# Exit
"0")
    exit 0
    ;;


# Install/Update Pacman packages
"1")
    for package in "${pacman[@]}"; do
	eval "sudo pacman -S $package"
    done

    for package in "${yay[@]}"; do
	eval "yay pacman -S $package"
    done

    echo "Packages installed/updated successfully !"
    exit 0
    ;;


# Update config files
"2")
    # Zsh config
    cat Common/home/.zshrc > ~/.zshrc

    # Ssh config
    mkdir -p ~/.ssh
    cat Common/home/.ssh/config > ~/.ssh/config

    # Git config
    cat Common/home/.gitconfig > ~/.gitconfig

    # NeoVim config
    mkdir -p ~/.config/nvim
    cat Common/home/.config/nvim/init.lua > ~/.config/nvim/init.lua
    cat Common/home/.config/nvim/lazy-lock.json > ~/.config/nvim/lazy-lock.json

    # Kitty config
    mkdir -p ~/.config/kitty
    cat Common/home/.config/kitty/kitty.conf > ~/.config/kitty/kitty.conf

    # Hyprland config
    mkdir -p ~/.config/hypr
    mkdir -p ~/.config/wallpapers
    cat Arch/home/.config/hypr/hyprland.conf > ~/.config/hypr/hyprland.conf
    cat Arch/home/.config/hypr/hyprlock.conf > ~/.config/hypr/hyprlock.conf
    cat Arch/home/.config/hypr/hypridle.conf > ~/.config/hypr/hypridle.conf
    cat Arch/home/.config/hypr/hyprpaper.conf > ~/.config/hypr/hyprpaper.conf
    cp -a Arch/home/.config/wallpapers/. ~/.config/wallpapers/

    # Waybar config
    mkdir -p ~/.config/waybar
    cat Arch/home/.config/waybar/config > ~/.config/waybar/config
    cat Arch/home/.config/waybar/style.css > ~/.config/waybar/style.css

    # Wofi config
    mkdir -p ~/.config/wofi
    cat Arch/home/.config/wofi/style.css > ~/.config/wofi/style.css

    # Dunst config
    mkdir -p /etc/dunst
    cat Arch/etc/dunst/dunstrc > /etc/dunst/dunstrc

    # Pacman config
    #sudo cat Arch/etc/pacman.conf > /etc/pacman.conf

    echo "Config files updated successfully"
    exit 0
    ;;


*)
    echo "Please enter a valid value !"
    ;;

esac


done
