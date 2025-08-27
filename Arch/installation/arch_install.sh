#!/bin/bash

GREEN="\033[32m"
RED="\033[31m"
END="\033[0m"

function print_border() {
    printf "$1=======================================${END}\n"
}

function message() {
    print_border "$END"
    printf "$1\n"
    print_border "$END"
}

function success_message() {
    print_border "$GREEN"
    printf "${GREEN}SUCCESS : $1${END}\n"
    print_border "$GREEN"
}

function error_message() {
    print_border "$RED"
    printf "${RED}ERROR : $1${END}\n"
    print_border "$RED"
}


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

ip link
ping -c 5 archlinux.org

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

if [[  ]]; then
    error_message "The system clock isn't synced."
else
    success_message "The system clock is synced."
fi


# =======================================
#
# Partitioning disks
#
# =======================================

message "Starting cfdisk for first disk partitionning. Press enter to continue."
read
cfdisk /dev/sda

message "Starting cfdisk for second disk partitionning. Press enter to continue."
read
cfdisk /dev/sdb

echo "Enter the name of the BOOT partition (Example : sda1) : "
read boot

echo "Enter the name of the SWAP partition (Example : sda2) : "
read swap

echo "Enter the name of the ROOT partition (Example : sda3) : "
read root


if [[ *"$(lsblk)"* == "$boot" ]]; then
    error_message "BOOT partition /dev/$boot doesn't exist."
    exit 1
fi

if [[ *"$(lsblk)"* == "$root" ]]; then
    error_message "ROOT partition /dev/$root doesn't exist."
    exit 1
fi

if [[ *"$(lsblk)"* == "$swap" ]]; then
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
else
    success_message "Base system packages installed successfully."
fi


# =======================================
#
# Configure the system
#
# =======================================

genfstab -U /mnt >> /mnt/etc/fstab

cat /mnt/etc/fstab

# TODO : Check result


message "INSTALLATION SUCCESSUL. ENTER THE SYSTEM WITH THE FOLLOWING COMMAND THEN EXECUTE THE NEXT SCRIPT"
echo "arch-chroot /mnt"
