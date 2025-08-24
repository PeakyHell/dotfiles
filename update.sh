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

echo "Don't forget to source ~/.zshrc !"
