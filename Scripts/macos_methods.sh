#!/bin/zsh
set -euo pipefail


# ==================================
#
# Requirements
#
# ==================================
if [[ ! -f "$DOTFILES/Scripts/helper.sh" ]]; then
	printf '%s not found !\n' "$DOTFILES/Scripts/helper.sh" >&2
	exit 1
fi
. "$DOTFILES/Scripts/helper.sh"


# ==================================
#
# Methods
#
# ==================================
macos_prompt() {
	while true; do
	clear
	printf "============================================\n"
	printf "    Choose an option :\n"
	printf "    [1] Install Homebrew\n"
	printf "    [2] Install/Update Homebrew packages\n"
	printf "    [3] Update config files\n"
	printf "    [4] Apply MacOs settings\n"
	printf "    [0] Exit\n"
	printf "============================================\n"
	read -r option
	case "$option" in

		# Exit
		"0")
			break
			;;

		# Install Homebrew
		"1")
			macos_manager
			press_any_key
			;;

		# Install/Update Homebrew packages
		"2")
			macos_packages
			press_any_key
			;;

		# Update config files
		"3")
			macos_config_files
			press_any_key
			;;

		# Apply MacOs settings
		"4")
			macos_settings
			press_any_key
			;;

		# Default
		*)
			printf "Please enter a valid value !\n"
			;;
	esac
	done
}


macos_manager() {
	if ! command -v brew &>/dev/null; then
		printf "Homebrew not installed !\n Installing...\n"
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		printf "Homebrew installed successfully !\n"
	else
		printf "Homebrew is already installed !\nUpdating...\n"
		brew update
		printf "Homebrew updated successfully ! \n"
	fi
}


macos_packages() {
	# Ensure Homebrew is installed and/or up to date
	macos_manager

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
			brew install --cask --appdir="$HOME/Applications" "$cask"
		fi
	done
	printf "Missing packages installed successfully !\n"


	# Remove Librewolf from quarantine
	local librewolf_app="$HOME/Applications/LibreWolf.app"
	if [[ -d "$librewolf_app" ]] && xattr "$librewolf_app" 2>/dev/null | grep -q "com.apple.quarantine"; then
		xattr -d com.apple.quarantine "$librewolf_app"
	fi
}


macos_config_files() {
	# Install OhMyZsh plugins
	clone_or_pull "https://github.com/zsh-users/zsh-autosuggestions" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
	clone_or_pull "https://github.com/zsh-users/zsh-syntax-highlighting.git" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
	clone_or_pull "https://github.com/MichaelAquilina/zsh-you-should-use.git" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/you-should-use"

	# Stow
	cd "$DOTFILES/Common"
	stow -t "$HOME" --adopt home
	git restore .

	printf "Config files updated successfully\n"
}


macos_settings() {
	# Show hidden files
	defaults write com.apple.finder "AppleShowAllFiles" -bool "true"

	# Show path bar
	defaults write com.apple.finder "ShowPathbar" -bool "true"

	# Auto hide dock
	defaults write com.apple.dock "autohide" -bool "true"

	# Merge minimized applications to their icon
	defaults write com.apple.dock minimize-to-application -bool "true"

	# Don't create .DS_Store on network drives
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool "true"

	# Don't create .DS_Store on external drives
	defaults write com.apple.desktopservices DSDontWriteUSBStores -bool "true"

	# Apply settings
	killall Finder
	killall Dock

	printf "Settings applied successfully\n"
}
