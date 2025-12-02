#!/bin/bash

# ==================================
#
# Variables
#
# ==================================
if [[ ! -f Arch/pacman.txt ]]; then
	printf "Arch/pacman.txt not found !\n"
	exit 1
fi
if [[ ! -f Arch/yay.txt ]]; then
	printf "Arch/yay.txt not found !\n"
	exit 1
fi
if [[ ! -f MacOs/formulaes.txt ]]; then
	printf "MacOs/formulaes.txt not found !\n"
	exit 1
fi
if [[ ! -f MacOs/casks.txt ]]; then
	printf "MacOs/casks.txt not found !\n"
	exit 1
fi
if [[ ! -f Windows/chocolatey.txt ]]; then
	printf "Windows/chocolatey.txt not found !\n"
	exit 1
fi


pacman=()
while IFS= read -r line; do pacman+=("$line"); done < Arch/pacman.txt

yay=()
while IFS= read -r line; do yay+=("$line"); done < Arch/yay.txt

formulaes=()
while IFS= read -r line; do formulaes+=("$line"); done < MacOs/formulaes.txt

casks=()
while IFS= read -r line; do casks+=("$line"); done < MacOs/casks.txt

chocolatey=()
while IFS= read -r line; do chocolatey+=("$line"); done < Windows/chocolatey.txt


# ==================================
#
# Script
#
# ==================================
while true; do
clear
printf "==================================\n"
printf "    Select your platform :\n"
printf "    [1] Arch Linux\n"
printf "    [2] MacOs\n"
printf "    [3] Windows (WSL)\n"
printf "    [0] Exit\n"
printf "==================================\n"
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
		printf "Can't execute Arch Linux scripts on your platform !\n"
		continue
	fi

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
		# Scripts/arch_install.sh
		;;

	# Install/Update Pacman packages
	"2")
		sudo pacman -Syu

		for package in "${pacman[@]}"; do
			sudo pacman -S --needed --noconfirm "$package"
		done

		for package in "${yay[@]}"; do
			yay -S --needed --noconfirm "$package"
		done

		printf "Packages installed/updated successfully !\n"
		printf "Press any key to exit..."
		read
		;;

	# Update config files
	"3")
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
		printf "Press any key to exit..."
		read
		;;

	# Default
	*)
		printf "Please enter a valid value !\n"
		;;

	esac
	done
	;;

# ==================================
#
# MacOs
#
# ==================================
"2")
	if [[ $(uname) != "Darwin" ]]; then
		printf "Can't execute MacOs scripts on your platform !\n"
		continue
	fi

	while true; do
	clear
	printf "============================================\n"
	printf "    Choose an option :\n"
	printf "    [1] Install Homebrew\n"
	printf "    [2] Install/Update Homebrew packages\n"
	printf "    [3] Update config files\n"
	printf "    [4] Apply MacOs settings\n"
	printf "    [0] Go back\n"
	printf "============================================\n"
	read option
	case "$option" in

	# Exit
	"0")
		break
		;;

	# Install Homebrew
	"1")
		if ! brew --version &>/dev/null; then
			sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
			printf "Homebrew installed successfully !\n"
		else
			printf "Homebrew is already installed !\nUpdating...\n"
			brew update
			printf "Homebrew updated successfully ! \n"
		fi

		printf "Press any key to exit..."
		read
		;;

	# Install/Update Homebrew packages
	"2")
		# Ensure Homebrew is installed and/or up to date
		if ! brew --version &>/dev/null; then
			printf "Homebrew not installed !\n Installing...\n"
			sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
			printf "Homebrew installed successfully !\n"
		else
			printf "Updating Homebrew...\n"
			brew update
			printf "Hombrew updated successfully !\n"
		fi


		# Upgrade already installed packages
		printf "Upgrading packages...\n"
		brew upgrade
		printf "Packages upgraded successfully !\n"


		# Find missing packages
		installed_formulaes="$(brew list --formula)"
		installed_casks="$(brew list --cask)"


		# Install missing packages
		printf "Installing missing packages...\n"
		for formulae in "${formulaes[@]}"; do
			if ! echo "$installed_formulaes" | grep -q "^$formulae$"; then
				brew install --formula "$formulae"
			fi
		done

		for cask in "${casks[@]}"; do
			if ! echo "$installed_casks" | grep -q "^$cask$"; then
				brew install --cask --appdir=\"~/Applications\" "$cask"
			fi
		done
		printf "Missing packages installed successfully !\n"


		# Remove Librewolf from quarantine
		if xattr -l ~/Applications/LibreWolf.app/ | grep -q "^com.apple.quarantine$"; then
			xattr -d com.apple.quarantine ~/Applications/LibreWolf.app
		fi


		printf "Press any key to exit..."
		read
		;;

	# Update config files
	"3")
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

		printf "Config files updated successfully\n"
		printf "Press any key to exit..."
		read
		;;

	# Apply MacOs settings
	"4")
		# Show hidden files
		defaults write com.apple.finder "AppleShowAllFiles" -bool "true"

		# Show path bar
		defaults write com.apple.finder "ShowPathbar" -bool "true"

		# Auto hide dock
		defaults write com.apple.dock "autohide" -bool "true"

		# Merge minimized applications to their icon
		defaults write com.apple.dock minimize-to-application -bool "true"

		# Apply settings
		killall Finder
		killall Dock

		printf "Settings applied successfully\n"
		printf "Press any key to exit..."
		read
		;;

	# Default
	*)
		printf "Please enter a valid value !\n"
		;;
	esac
	done
	;;


# ==================================
#
# Windows
#
# ==================================
"3")
	if [[ $(uname) != "Linux" ]]; then
		printf "Windows scripts must be executed from WSL !\n"
		continue
	fi

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
		cmd.exe /c "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
		printf "Chocolatey installed successfully !\n"
		printf "Press any key to exit..."
		read
		;;
	
	# Install/Update Chocolatey packages
	"2")
		choco upgrade chocolatey

		for formulae in "${formulaes[@]}"; do
			choco install "$formulae"
		done

		printf "Packages installed/updated successfully !\n"
		printf "Press any key to exit..."
		read
		;;

	# Update config files (WSL)
	"3")
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

		# Pacman config
		cat Arch/etc/pacman.conf | sudo tee /etc/pacman.conf > /dev/null

		printf "Config files updated successfully\n"
		printf "Press any key to exit..."
		read
		;;

	# Apply Windows settings
	"4")
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
		printf "Press any key to exit..."
		read
		;;
	
	# Default
	*)
		printf "Please enter a valid value !\n"
		;;

	esac
	done
	;;


# ==================================
#
# Default
#
# ==================================
*)
	printf "Please enter a valid value !\n"
	;;


esac
done
