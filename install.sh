#!/bin/zsh
set -euo pipefail


# ==================================
#
# Requirements
#
# ==================================
DOTFILES="$(cd -- "$(dirname -- "$0")" && pwd)"

if [[ ! -f "$DOTFILES/Scripts/helper.sh" ]]; then
	printf '%s not found !\n' "$DOTFILES/Scripts/helper.sh" >&2
	exit 1
fi
. "$DOTFILES/Scripts/helper.sh"


# ==================================
#
# Script
#
# ==================================
platform="$(get_platform)"
case "$platform" in

	# Arch Linux
	"Arch")
		require_file "$DOTFILES/Scripts/arch_methods.sh"
		. "$DOTFILES/Scripts/arch_methods.sh"

		require_file "$DOTFILES/Arch/pacman.txt"
		require_file "$DOTFILES/Arch/yay.txt"
		set -A pacman "${(f)$(build_array_from_file "$DOTFILES/Arch/pacman.txt")}"
		set -A yay "${(f)$(build_array_from_file "$DOTFILES/Arch/yay.txt")}"

		arch_prompt
		;;

	# MacOs
	"MacOS")
		require_file "$DOTFILES/Scripts/macos_methods.sh"
		. "$DOTFILES/Scripts/macos_methods.sh"

		require_file "$DOTFILES/MacOs/formulaes.txt"
		require_file "$DOTFILES/MacOs/casks.txt"
		set -A formulaes "${(f)$(build_array_from_file "$DOTFILES/MacOs/formulaes.txt")}"
		set -A casks "${(f)$(build_array_from_file "$DOTFILES/MacOs/casks.txt")}"

		macos_prompt
		;;

	# Windows
	"Windows")
		require_file "$DOTFILES/Scripts/windows_methods.sh"
		. "$DOTFILES/Scripts/windows_methods.sh"

		require_file "$DOTFILES/Windows/chocolatey.txt"
		set -A chocolatey "${(f)$(build_array_from_file "$DOTFILES/Windows/chocolatey.txt")}"

		windows_prompt
		;;

	# Default
	*)
		printf "Error while detecting your OS !\n" >&2
		exit 1
		;;
esac
