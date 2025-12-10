#!/bin/bash


windows_prompt() {
	while true; do
	clear
	printf "============================================\n"
	printf "    Choose an option :\n"
	printf "    [1] Install Chocolatey\n"
	printf "    [2] Install/Update Chocolatey packages\n"
	printf "    [3] Update config files (WSL)\n"
	printf "    [4] Apply Windows settings\n"
	printf "    [0] Go back\n"
	printf "============================================\n"
	read option
	case "$option" in

		# Exit
		"0")
			break
			;;

		# Install Chocolatey
		"1")
			windows_manager
			printf "Press any key to exit..."
			read
			;;
		
		# Install/Update Chocolatey packages
		"2")
			windows_packages
			printf "Press any key to exit..."
			read
			;;

		# Update config files (WSL)
		"3")
			windows_config_files
			printf "Press any key to exit..."
			read
			;;

		# Apply Windows settings
		"4")
			windows_settings
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


windows_manager() {
	cmd.exe /c "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
	printf "Chocolatey installed successfully !\n"
}


windows_packages() {
	choco upgrade chocolatey

	for formulae in "${formulaes[@]}"; do
		choco install "$formulae"
	done

	printf "Packages installed/updated successfully !\n"
}


windows_config_files() {
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
	# mkdir -p ~/.config/kitty
	# cat Common/home/.config/kitty/kitty.conf > ~/.config/kitty/kitty.conf

	# OhMyZsh
	# DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	# [ -d "$DIR"/.git ] && git -C "$DIR" pull || git clone https://github.com/zsh-users/zsh-autosuggestions "$DIR"

	# DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	# [ -d "$DIR"/.git ] && git -C "$DIR" pull || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$DIR"

	# DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
	# [ -d "$DIR"/.git ] && git -C "$DIR" pull || git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "$DIR"

	# Fastfetch config
	# mkdir -p ~/.config/fastfetch
	# cat Common/home/.config/fastfetch/config.jsonc > ~/.config/fastfetch/config.jsonc

	# Pacman config
	cat Arch/etc/pacman.conf | sudo tee /etc/pacman.conf > /dev/null

	printf "Config files updated successfully\n"
}


windows_settings() {
	REG="/mnt/c/Windows/System32/reg.exe"

	# Show hidden files
	"$REG" ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f
	"$REG" ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t REG_DWORD /d 1 /f

	# Disable mouse acceleration
	"$REG" ADD "HKCU\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d 10 /f
	"$REG" ADD "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f
	"$REG" ADD "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f
	"$REG" ADD "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f

	printf "Settings applied successfully\n"
}
