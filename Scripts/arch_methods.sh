#!/bin/bash

. ./Scripts/helper.sh

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
	# Install OhMyZsh plugins
	clone_or_pull "https://github.com/zsh-users/zsh-autosuggestions" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
	clone_or_pull "https://github.com/zsh-users/zsh-syntax-highlighting.git" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
	clone_or_pull "https://github.com/MichaelAquilina/zsh-you-should-use.git" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/you-should-use"

	# Stow
	cd "$DOTFILES"
	stow -t "$HOME/.config/nvim/" --adopt kickstart.nvim
	git restore .

	cd "$DOTFILES/Common"
	stow -t "$HOME" --adopt home
	git restore .

	cd "$DOTFILES/Arch"
	sudo stow -t --adopt /etc etc
	stow -t "$HOME" --adopt home
	git restore .
	

	printf "Config files updated successfully\n"
}
