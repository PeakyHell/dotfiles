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
	cat "$DOTFILES/Common/home/.zshrc" > "$HOME/.zshrc"
	/bin/zsh -c "source $HOME/.zshrc"

	# Ssh config
	mkdir -p "$HOME/.ssh"
	cat "$DOTFILES/Common/home/.ssh/config" > "$HOME/.ssh/config"

	# Git config
	cat "$DOTFILES/Common/home/.gitconfig" > "$HOME/.gitconfig"
	cat "$DOTFILES/Common/home/.gitignore" > "$HOME/.gitignore"

	# NeoVim config
	mkdir -p "$HOME/.config/nvim"
	cat "$DOTFILES/Common/home/.config/nvim/init.lua" > "$HOME/.config/nvim/init.lua"
	cat "$DOTFILES/Common/home/.config/nvim/lazy-lock.json" > "$HOME/.config/nvim/lazy-lock.json"

	# Kitty config
	mkdir -p "$HOME/.config/kitty"
	cat "$DOTFILES/Common/home/.config/kitty/kitty.conf" > "$HOME/.config/kitty/kitty.conf"

	# OhMyZsh
	DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	[ -d "$DIR"/.git ] && git -C "$DIR" pull || git clone https://github.com/zsh-users/zsh-autosuggestions "$DIR"

	DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	[ -d "$DIR"/.git ] && git -C "$DIR" pull || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$DIR"

	DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
	[ -d "$DIR"/.git ] && git -C "$DIR" pull || git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "$DIR"

	# Fastfetch config
	mkdir -p "$HOME/.config/fastfetch"
	cat "$DOTFILES/Common/home/.config/fastfetch/config.jsonc" > "$HOME/.config/fastfetch/config.jsonc"

	# Hyprland config
	mkdir -p "$HOME/.config/hypr"
	mkdir -p "$HOME/.config/wallpapers"
	cat "$DOTFILES/Arch/home/.config/hypr/hyprland.conf" > "$HOME/.config/hypr/hyprland.conf"
	cat "$DOTFILES/Arch/home/.config/hypr/hyprlock.conf" > "$HOME/.config/hypr/hyprlock.conf"
	cat "$DOTFILES/Arch/home/.config/hypr/hypridle.conf" > "$HOME/.config/hypr/hypridle.conf"
	cat "$DOTFILES/Arch/home/.config/hypr/hyprpaper.conf" > "$HOME/.config/hypr/hyprpaper.conf"
	cp -a "$DOTFILES/Arch/home/.config/wallpapers/." "$HOME/.config/wallpapers/"

	# Waybar config
	mkdir -p "$HOME/.config/waybar"
	cat "$DOTFILES/Arch/home/.config/waybar/config" > "$HOME/.config/waybar/config"
	cat "$DOTFILES/Arch/home/.config/waybar/style.css" > "$HOME/.config/waybar/style.css"

	# Wofi config
	mkdir -p "$HOME/.config/wofi"
	cat "$DOTFILES/Arch/home/.config/wofi/style.css" > "$HOME/.config/wofi/style.css"

	# Dunst config
	mkdir -p /etc/dunst
	cat "$DOTFILES/Arch/etc/dunst/dunstrc" | sudo tee /etc/dunst/dunstrc > /dev/null

	# Pacman config
	cat "$DOTFILES/Arch/etc/pacman.conf" | sudo tee /etc/pacman.conf > /dev/null

	# Conky config
	mkdir -p "$HOME/.config/conky"
	cat "$DOTFILES/Arch/home/.config/conky/conky.conf" > "$HOME/.config/conky/conky.conf"

	# Sddm config
	cat "$DOTFILES/Arch/etc/sddm.conf" | sudo tee /etc/sddm.conf > /dev/null

	printf "Config files updated successfully\n"
}
