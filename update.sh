#!/bin/zsh

# Zsh config
cat home/.zshrc > ~/.zshrc

# Ssh config
mkdir -p ~/.ssh
cat home/.ssh/config > ~/.ssh/config

# Git config
cat home/.gitconfig > ~/.gitconfig

# NeoVim config
mkdir -p ~/.config/nvim
cat home/.config/nvim/init.lua > ~/.config/nvim/init.lua
cat home/.config/nvim/lazy-lock.json > ~/.config/nvim/lazy-lock.json

# Hyprland config
mkdir -p ~/.config/hypr
mkdir -p ~/.config/wallpapers
cat home/.config/hypr/hyprland.conf > ~/.config/hypr/hyprland.conf
cat home/.config/hypr/hyprlock.conf > ~/.config/hypr/hyprlock.conf
cat home/.config/hypr/hypridle.conf > ~/.config/hypr/hypridle.conf
cat home/.config/hypr/hyprpaper.conf > ~/.config/hypr/hyprpaper.conf
cp -a home/.config/wallpapers/. ~/.config/wallpapers/

# Kitty config
mkdir -p ~/.config/kitty
cat home/.config/kitty/kitty.conf > ~/.config/kitty/kitty.conf

# Waybar config
mkdir -p ~/.config/waybar
cat home/.config/waybar/config > ~/.config/waybar/config
cat home/.config/waybar/style.css > ~/.config/waybar/style.css

# Wofi config
mkdir -p ~/.config/wofi
cat home/.config/wofi/style.css > ~/.config/wofi/style.css

# Dunst config
mkdir -p /etc/dunst
cat etc/dunst/dunstrc > /etc/dunst/dunstrc

# Pacman config
#sudo cat etc/pacman.conf > /etc/pacman.conf

echo "Don't forget to source ~/.zshrc !"
