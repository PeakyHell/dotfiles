#!/bin/zsh


while true; do


clear
echo "=================================="
echo "    Choose an option :"
echo "    [1] Install for Arch Linux"
echo "    [2] Install for MacOs"
echo "    [0] Exit"
echo "=================================="

read option


case "$option" in

# Exit
"0")
    exit
    ;;


# Arch Linux
"1")
    if [[ $(uname) != "Linux" ]]; then
        echo "Can't execute Arch Linux script on your platform !"
	exit 1
    fi

    sh Scripts/arch_script.sh
    ;;


# MacOs
"2")
    if [[ $(uname) != "Darwin" ]]; then
        echo "Can't execute MacOs script on your platform !"
	exit 1
    fi

    sh Scripts/macos_script.sh
    ;;


# Default
*)
    echo "Please enter a valid value !"
    ;;

esac


done
