#!/bin/zsh


formulaes=("fastfetch" "gcc" "git" "neovim" "node" "openjdk" "python" "xclip")
casks=("discord" "docker" "kitty" "librewolf --no-quarantine" "obsidian" "protonvpn" "scroll-reverser" "spotify")


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
    echo "Config files updated successfully"
    exit 0
    ;;


"4")
    # Show hidden files
    defaults write com.apple.finder "AppleShowAllFiles" -bool "true"

    # Show path bar
    defaults write com.apple.finder "ShowPathbar" -bool "true"

    # Auto hide dock
    defaults write com.apple.dock "autohide" -bool "true"
    exit 0
    ;;


*)
    echo "Please enter a valid value !"

esac


done
