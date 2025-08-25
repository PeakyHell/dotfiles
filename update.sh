#!/bin/zsh

# Zsh config
cat home/.zshrc > ~/.zshrc

# Ssh config
cat home/.ssh/config > ~/.ssh/config

# Git config
cat home/.gitconfig > ~/.gitconfig

# NeoVim config
cat home/.config/nvim/init.lua > ~/.config/nvim/init.lua
cat home/.config/nvim/lazy-lock.json > ~/.config/nvim/lazy-lock.json

# Hyprland config
cat home/.config/hypr/hyprland.conf > ~/.config/hypr/hyprland.conf
cat home/.config/hypr/hyprlock.conf > ~/.config/hypr/hyprlock.conf

# Waybar config
cat home/.config/waybar/config > ~/.config/waybar/config

# Pacman config
#sudo cat etc/pacman.conf > /etc/pacman.conf

echo "Don't forget to source ~/.zshrc !"
