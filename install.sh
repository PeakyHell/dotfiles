#!/bin/bash


# ==================================
#
# Modules
#
# ==================================
. ./Scripts/arch_methods.sh
. ./Scripts/macos_methods.sh
. ./Scripts/windows_methods.sh


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

	# Exit
	"0")
		exit 0
		;;

	# Arch Linux
	"1")
		if [[ $(uname) != "Linux" ]]; then
			printf "Can't execute Arch Linux scripts on your platform !\n"
			continue
		fi
		arch_prompt
		;;

	# MacOs
	"2")
		if [[ $(uname) != "Darwin" ]]; then
			printf "Can't execute MacOs scripts on your platform !\n"
			continue
		fi
		macos_prompt
		;;

	# Windows
	"3")
		if [[ $(uname) != "Linux" ]]; then
			printf "Windows scripts must be executed from WSL !\n"
			continue
		fi
		windows_prompt
		;;

	# Default
	*)
		printf "Please enter a valid value !\n"
		;;
esac
done
