#!/bin/bash

# ==================================
#
# Variables and functiions
#
# ==================================

GREEN="\033[32m"
RED="\033[31m"
END="\033[0m"

DISKS=(sda sdb)

function success_message() {
    printf "${GREEN}SUCCESS :${END} $1\n"
}

function error_message() {
    printf "${RED}ERROR :${END} $1\n"
}


# ==================================
#
# Script
#
# ==================================

while true; do
clear
echo "======================================================"
echo "    Welcome to the Arch Linux Installation Script."
echo "    Please choose an option :"
echo "    [1] Install a fresh Arch Linux"
echo "    [2] Configure services"
echo "    [3] Install and configure Hyprland"
echo "    [0] Exit"
echo "======================================================"
read option
case $option in


# =======================================
#
# Exit
#
# =======================================
"0")
    exit 0
    ;;


# =======================================
#
# Fresh Arch Linux installation
#
# =======================================
"1")
    # =======================================
    #
    # Set belgian keyboard layout
    #
    # =======================================

    loadkeys be-latin1

    if [[ $? -ne 0 ]]; then
        error_message "Failed to load belgian keymap."
        exit 1
    else
        success_message "Belgian keymap loaded successfully."
    fi


    # =======================================
    #
    # Verify boot mode
    #
    # =======================================

    if [[ ! -f /sys/firmware/efi/fw_platform_size ]] || [[ $(< /sys/firmware/efi/fw_platform_size) != 64 ]]; then
        error_message "The system booted in : $(< /sys/firmware/efi/fw_platform_size). Please boot in UEFI 64-bit mode."
        exit 1
    else
        success_message "Correct boot mode used (UEFI 64-bit)."
    fi


    # =======================================
    #
    # Check internet connection
    #
    # =======================================

    ip link > /dev/null
    ping -c 5 google.com > /dev/null

    if [[ $? -ne 0 ]]; then
        error_message "Could not connect to the internet."
        exit 1
    else
        success_message "Internet connection established."
    fi


    # =======================================
    #
    # Update system clock
    #
    # =======================================

    timedatectl set-ntp true; sleep 5
    if [[ "$(timedatectl status | grep 'System clock synchronized' | awk '{print $4}')" != "yes" ]]; then
        error_message "The system clock isn't synchronized."
        exit 1
    else
        success_message "The system clock is synchronized."
    fi


    # =======================================
    #
    # Partitioning disks
    #
    # =======================================

    for disk in "${DISKS[@]}"; do
        printf "Starting cfdisk for ${disk} partitionning. Press enter to continue."
        read
        cfdisk /dev/$disk
        if [[ $? -ne 0 ]]; then
            error_message "Failed to partition disk /dev/$disk"
    	exit 1
        fi
    done


    printf "Enter the name of the BOOT partition (Example : sda1) : "
    read boot

    printf "Enter the name of the SWAP partition (Example : sda2) : "
    read swap

    printf "Enter the name of the ROOT partition (Example : sda3) : "
    read root


    if ! lsblk -o NAME | grep -w "$boot"; then
        error_message "BOOT partition /dev/$boot doesn't exist."
        exit 1
    fi

    if ! lsblk -o NAME | grep -w "$root"; then
        error_message "ROOT partition /dev/$root doesn't exist."
        exit 1
    fi

    if ! lsblk -o NAME | grep -w "$swap"; then
        error_message "SWAP partition /dev/$swap doesn't exist."
        exit 1
    fi


    success_message "Disks partitioned successfully."


    # =======================================
    #
    # Formatting and mounting partitions
    #
    # =======================================

    # Formatting
    mkfs.ext4 /dev/$root
    if [[ $? -ne 0 ]]; then
        error_message "Failed to format ROOT partition /dev/$root"
        exit 1
    fi

    mkfs.fat -F 32 /dev/$boot
    if [[ $? -ne 0 ]]; then
        error_message "Failed to format BOOT partition /dev/$boot"
        exit 1
    fi

    mkswap /dev/$swap
    if [[ $? -ne 0 ]]; then
        error_message "Failed to format SWAP partition /dev/$swap"
        exit 1
    fi


    # Mounting
    mount /dev/$root /mnt
    if [[ $? -ne 0 ]]; then
        error_message "Failed to mount ROOT partition /dev/$root"
        exit 1
    fi

    mount --mkdir /dev/$boot /mnt/boot
    if [[ $? -ne 0 ]]; then
        error_message "Failed to mount BOOT partition /dev/$boot"
        exit 1
    fi

    swapon /dev/$swap
    if [[ $? -ne 0 ]]; then
        error_message "Failed to mount SWAP partition /dev/$swap"
        exit 1
    fi


    success_message "Disks formatted and mounted successfully."


    # =======================================
    #
    # Installing the base system
    #
    # =======================================

    pacstrap -K /mnt base linux linux-firmware amd-ucode grub efibootmgr networkmanager nvim sudo zsh

    if [[ $? -ne 0 ]]; then
        error_message "Failed to install base system packages."
        exit 1
    else
        success_message "Base system packages installed successfully."
    fi


    # =======================================
    #
    # Configure the system
    #
    # =======================================

    genfstab -U /mnt >> /mnt/etc/fstab

    if ! grep -w "/dev/$root" /mnt/etc/fstab; then
        error_message "The configuration is missing the ROOT partition /dev/$root"
        exit 1
    fi

    if ! grep -w "/dev/$boot" /mnt/etc/fstab; then
        error_message "The configuration is missing the BOOT partition /dev/$boot"
        exit 1
    fi

    if ! grep -w "/dev/$swap" /mnt/etc/fstab; then
        error_message "The configuration is missing the SWAP partition /dev/$swap"
        exit 1
    fi

    success_message "The partitions configuration has been set successfully."


    success_message "FIRST PART OF INSTALLATION SUCCESSFULL. CONTINUING TO CHROOT."


    # =======================================
    #
    # Chroot
    #
    # =======================================

    arch-chroot /mnt ./chroot_script.sh

    if [[ $? -ne 0 ]]; then
        error_message "Chroot configuration failed."
        exit 1
    else
        success_message "Chroot configuration completed successfully."
    fi

    # =======================================
    #
    # Reboot
    #
    # =======================================

    umount -R /mnt

    if [[ $? -ne 0 ]]; then
        error_message "Failed to unmount the drives."
        exit 1
    else
        success_message "Drives unmounted successfully. Rebooting."
    fi

    reboot
    ;;


# ==================================
#
# Configure services
#
# ==================================
"2")

    ;;


# ==================================
#
# Install and configure Hyprland
#
# ==================================
"3")

    ;;


esac
done
