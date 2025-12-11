#!/bin/bash

. ./Scripts/helper.sh

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
	# Install OhMyZsh plugins
	# clone_or_pull "https://github.com/zsh-users/zsh-autosuggestions" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
	# clone_or_pull "https://github.com/zsh-users/zsh-syntax-highlighting.git" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
	# clone_or_pull "https://github.com/MichaelAquilina/zsh-you-should-use.git" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/you-should-use"

	# Pacman config
	cat "$DOTFILES/Arch/etc/pacman.conf" | sudo tee /etc/pacman.conf > /dev/null

	# Stow
	cd "$DOTFILES"
	stow -t "$HOME/.config/nvim/" --adopt kickstart.nvim
	git restore .

	cd "$DOTFILES/Common"
	stow -t "$HOME" --adopt home
	git restore .

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
