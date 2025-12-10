#!/bin/bash


arch_prompt() {
	while true; do
	clear
	printf "==========================================\n"
	printf "    Choose an option :\n"
	printf "    [1] Install Arch Linux\n"
	printf "    [2] Install/Update Pacman packages\n"
	printf "    [3] Update config files\n"
	printf "    [0] Go back\n"
	printf "==========================================\n"
	read option
	case "$option" in

		# Exit
		"0")
			break
			;;

		# Install Arch Linux
		"1")
			arch_install
			;;

		# Install/Update Pacman packages
		"2")
			arch_packages
			printf "Press any key to exit..."
			read
			;;

		# Update config files
		"3")
			arch_config_files
			printf "Press any key to exit..."
			read
			;;

		# Default
		*)
			printf "Please enter a valid value !\n"
			;;

	esac
	done
}


arch_install() {
	# Scripts/arch_install.sh
}


arch_packages() {
	sudo pacman -Syu

	for package in "${pacman[@]}"; do
		sudo pacman -S --needed --noconfirm "$package"
	done

	for package in "${yay[@]}"; do
		yay -S --needed --noconfirm "$package"
	done

	printf "Packages installed/updated successfully !\n"
}


arch_config_files() {
	# Zsh config
	cat Common/home/.zshrc > ~/.zshrc
	/bin/zsh -c "source ~/.zshrc"

	# Ssh config
	mkdir -p ~/.ssh
	cat Common/home/.ssh/config > ~/.ssh/config

	# Git config
	cat Common/home/.gitconfig > ~/.gitconfig
	cat Common/home/.gitignore > ~/.gitignore

	# NeoVim config
	mkdir -p ~/.config/nvim
	cat Common/home/.config/nvim/init.lua > ~/.config/nvim/init.lua
	cat Common/home/.config/nvim/lazy-lock.json > ~/.config/nvim/lazy-lock.json

	# Kitty config
	mkdir -p ~/.config/kitty
	cat Common/home/.config/kitty/kitty.conf > ~/.config/kitty/kitty.conf

	# OhMyZsh
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use

	# Fastfetch config
	mkdir -p ~/.config/fastfetch
	cat Common/home/.config/fastfetch/config.jsonc > ~/.config/fastfetch/config.jsonc

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
	cat Arch/etc/dunst/dunstrc | sudo tee /etc/dunst/dunstrc > /dev/null

	# Pacman config
	cat Arch/etc/pacman.conf | sudo tee /etc/pacman.conf > /dev/null

	# Conky config
	mkdir -p ~/.config/conky
	cat Arch/home/.config/conky/conky.conf > ~/.config/conky/conky.conf

	# Sddm config
	cat Arch/etc/sddm.conf | sudo tee /etc/sddm.conf > /dev/null

	printf "Config files updated successfully\n"
}
