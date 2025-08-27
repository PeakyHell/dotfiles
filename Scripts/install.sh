#!/bin/zsh

# ==================================
#
# Variables
#
# ==================================

pacman=()
while IFS= read -r line; do pacman+=("$line"); done < ../Arch/pacman.txt

yay=()
while IFS= read -r line; do yay+=("$line"); done < ../Arch/yay.txt

formulaes=()
while IFS= read -r line; do formulaes+=("$line"); done < ../MacOs/formulaes.txt

casks=()
while IFS= read -r line; do casks+=("$line"); done < ../MacOs/casks.txt


# ==================================
#
# Script
#
# ==================================

while true; do
clear
echo "=================================="
echo "    Select your platform :"
echo "    [1] Arch Linux"
echo "    [2] MacOs"
echo "    [0] Exit"
echo "=================================="
read os
case "$os" in


# ==================================
#
# Exit
#
# ==================================
"0")
    exit 0
    ;;


# ==================================
#
# Arch Linux
#
# ==================================
"1")
    if [[ $(uname) != "Linux" ]]; then
        echo "Can't execute Arch Linux scripts on your platform !"
	exit 1
    fi

    while true; do
    clear
    echo "=========================================="
    echo "    Choose an option :"
    echo "    [1] Install Arch Linux"
    echo "    [2] Install/Update Pacman packages"
    echo "    [3] Update config files"
    echo "    [0] Exit"
    echo "=========================================="
    read option
    case "$option" in

    # Exit
    "0")
        exit 0
	;;

    # Install Arch Linux
    "1")

	;;

    # Install/Update Pacman packages
    "2")
        for package in "${pacman[@]}"; do
	    eval "sudo pacman -S --needed --noconfirm $package"
        done

        for package in "${yay[@]}"; do
	    eval "yay -S --needed --noconfirm $package"
        done

        echo "Packages installed/updated successfully !"
        exit 0
	;;

    # Update config files
    "3")
        # Zsh config
        cat ../Common/home/.zshrc > ~/.zshrc

        # Ssh config
        mkdir -p ~/.ssh
        cat ../Common/home/.ssh/config > ~/.ssh/config

        # Git config
        cat ../Common/home/.gitconfig > ~/.gitconfig

        # NeoVim config
        mkdir -p ~/.config/nvim
        cat ../Common/home/.config/nvim/init.lua > ~/.config/nvim/init.lua
        cat ../Common/home/.config/nvim/lazy-lock.json > ~/.config/nvim/lazy-lock.json

        # Kitty config
        mkdir -p ~/.config/kitty
        cat ../Common/home/.config/kitty/kitty.conf > ~/.config/kitty/kitty.conf

        # Hyprland config
        mkdir -p ~/.config/hypr
        mkdir -p ~/.config/wallpapers
        cat ../Arch/home/.config/hypr/hyprland.conf > ~/.config/hypr/hyprland.conf
        cat ../Arch/home/.config/hypr/hyprlock.conf > ~/.config/hypr/hyprlock.conf
        cat ../Arch/home/.config/hypr/hypridle.conf > ~/.config/hypr/hypridle.conf
        cat ../Arch/home/.config/hypr/hyprpaper.conf > ~/.config/hypr/hyprpaper.conf
        cp -a ../Arch/home/.config/wallpapers/. ~/.config/wallpapers/

        # Waybar config
        mkdir -p ~/.config/waybar
        cat ../Arch/home/.config/waybar/config > ~/.config/waybar/config
        cat ../Arch/home/.config/waybar/style.css > ~/.config/waybar/style.css

        # Wofi config
        mkdir -p ~/.config/wofi
        cat ../Arch/home/.config/wofi/style.css > ~/.config/wofi/style.css

        # Dunst config
        mkdir -p /etc/dunst
        cat ../Arch/etc/dunst/dunstrc | sudo tee /etc/dunst/dunstrc > /dev/null

        # Pacman config
        cat ../Arch/etc/pacman.conf | sudo tee /etc/pacman.conf > /dev/null

        echo "Config files updated successfully"
        exit 0
	;;

    # Default
    *)
        echo "Please enter a valid value !"
	;;

    esac
    done


# ==================================
#
# MacOs
#
# ==================================
"2")
    if [[ $(uname) != "Darwin" ]]; then
        echo "Can't execute MacOs scripts on your platform !"
	exit 1
    fi

    while true; do
    clear
    echo "============================================"
    echo "    Choose an option :"
    echo "    [1] Install Homebrew"
    echo "    [2] Install/Update Homebrew packages"
    echo "    [3] Update config files"
    echo "    [4] Apply MacOs settings"
    echo "    [0] Exit"
    echo "============================================"
    read option
    case "$option" in

    # Exit
    "0")
        exit 0
	;;

    # Install Homebrew
    "1")
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo "Homebrew installed successfully !"
        exit 0
	;;

    # Install/Update Homebrew packages
    "2")
        for formulae in "${formulaes[@]}"; do
    	    brew install "$formulae"
        done

        for cask in "${casks[@]}"; do
	    eval "brew install --cask --appdir=\"~/Applications\" $cask"
        done

        echo "Packages installed/updated successfully !"
        exit 0
	;;

    # Update config files
    "3")
        # Zsh config
        cat ../Common/home/.zshrc > ~/.zshrc

        # Ssh config
        mkdir -p ~/.ssh
        cat ../Common/home/.ssh/config > ~/.ssh/config

        # Git config
        cat ../Common/home/.gitconfig > ~/.gitconfig

        # NeoVim config
        mkdir -p ~/.config/nvim
        cat ../Common/home/.config/nvim/init.lua > ~/.config/nvim/init.lua
        cat ../Common/home/.config/nvim/lazy-lock.json > ~/.config/nvim/lazy-lock.json

        # Kitty config
        mkdir -p ~/.config/kitty
        cat ../Common/home/.config/kitty/kitty.conf > ~/.config/kitty/kitty.conf

        echo "Config files updated successfully"
        exit 0
        ;;

    # Apply MacOs settings
    "4")
        # Show hidden files
        defaults write com.apple.finder "AppleShowAllFiles" -bool "true"

        # Show path bar
        defaults write com.apple.finder "ShowPathbar" -bool "true"

        # Auto hide dock
        defaults write com.apple.dock "autohide" -bool "true"

	echo "Settings applied successfully"
        exit 0
	;;

    # Default
    *)
        echo "Please enter a valid value !"
	;;
    esac
    done


# ==================================
#
# Default
#
# ==================================
*)
    echo "Please enter a valid value !"
    ;;


esac
done
