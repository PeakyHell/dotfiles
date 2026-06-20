[Source](https://wiki.archlinux.org/title/Installation_guide)




# Table of Contents

1. [Pre-installation](#pre-installation)
2. [Installation](#installation)
3. [Configure the system](#configure-the-system)
4. [Reboot](#reboot)
5. [Post-installation](#post-installation)




# Pre-installation

[Source](https://wiki.archlinux.org/title/Installation_guide#Pre-installation)


## Set the console keyboard layout

Check the list of available keymaps.

```
localectl list-keymaps
```


Set the keyboard layout of your choice.

```
loadkeys be-latin1
```


## Verify the boot mode

```
cat /sys/firmware/efi/fw_platform_size
```

Verify it returns `64`. If it returns `No such file or directory`, the system maybe booted in BIOS or CSM mode.

## Connect to internet

Ensure the network interface is listed and enabled.

```
ip link
```


If you use Wi-Fi, check [iwctl](https://wiki.archlinux.org/title/Iwctl) to connect.


Verify the connection.

```
ping -c 5 ping.archlinux.org
```


## Update the system clock

Ensure the system clock is correctly synchronized

```
timedatectl
```


If not, synchronize it.

```
timedatectl set-ntp true
```


## Partitioning the disk(s)

> [!WARNING]
> IF YOU WANT TO DUAL BOOT, WINDOWS SHOULD BE INSTALLED **BEFORE** ARCH. DO NOT TOUCH TO THIS DISK DURING ARCH INSTALLATION.

Use the `cfdisk` tool for a better experience.

```
cfdisk
```

Select the `gpt` label.

Free the necessary partitions then create the following partitions :

### Only ArchLinux (1 Drive)

- Drive 1 :

| Number | Partition | Type | Size |
|--------|-----------|------|------|
| 1 | Boot | EFI | 1GB |
| 2 | Swap | Linux Swap | RAM size |
| 3 | Root | Linux Filesystem | Rest of drive |

Then Write and Quit to go back to the terminal.

### Only ArchLinux (2 Drives)

- Drive 1 :

| Number | Partition | Type | Size |
|--------|-----------|------|------|
| 1 | Boot | EFI | 1GB |
| 2 | Swap | Linux Swap | RAM size |
| 3 | Root | Linux Filesystem | Rest of drive |


- Drive 2 :

| Number | Partition | Type | Size |
|--------|-----------|------|------|
| 1 | Home | Linux Filesystem | Whole drive |

Then Write and Quit to go back to the terminal.

### Dual Boot with Windows (1 Drive)


| Number | Partition | Size |
|--------|-----------|------|
| 1 | Windows | X |

TODO

Then Write and Quit to go back to the terminal.

### Dual Boot with Windows (2 Drives)

- Drive 1 :

| Number | Partition | Size |
|--------|-----------|------|
| 1 | Windows | Whole drive |

- Drive 2 :

| Number | Partition | Type | Size |
|--------|-----------|------|------|
| 1 | Boot | EFI | 1GB |
| 2 | Swap | Linux Swap | RAM size |
| 3 | Root | Linux Filesystem | Rest of drive |

Then Write and Quit to go back to the terminal.

## Formatting the partitions

List all the partitions for easier formatting.

```
lsblk
```

Then format the partitions as follow (replace XY with the disk name and number) :

- root partition
    ```
    mkfs.ext4 /dev/sdXY
    ```


- boot partition
    ```
    mkfs.fat -F 32 /dev/sdXY
    ```


- swap partition
    ```
    mkswap /dev/sdXY
    ```


- home partition (if separate)
    ```
    mkfs.ext4 /dev/sdXY
    ```


## Mount the partitions

- root partition
    ```
    mount /dev/sdXY /mnt
    ```


- boot partition
    ```
    mount --mkdir /dev/sdXY /mnt/boot
    ```


- swap partition
    ```
    swapon /dev/sdXY
    ```


- home partition (if separate)
    ```
    mount --mkdir /dev/sdXY /mnt/home
    ```


Finally, use `lsblk` again to check if partition are correctly mounted.




# Installation

[Source](https://wiki.archlinux.org/title/Installation_guide#Installation)

## Install the base system

Install the base packages to run the system properly.

- If you have an Intel CPU, use `intel-ucode` instead of `amd-ucode`.

- If you want to use an other text editor than Neovim you can also replace it.

- Zsh is optional, you can remove it if Bash is enough for you.

```
pacstrap -K /mnt base linux linux-firmware amd-ucode networkmanager neovim sudo zsh
```


# Configure the system

[Source](https://wiki.archlinux.org/title/Installation_guide#Configure_the_system)

## Define partitions

Define how the partition have been mounted.

```
genfstab -U /mnt >> /mnt/etc/fstab
```


Then check the result.

```
cat /mnt/etc/fstab
```


## Enter the system

```
arch-chroot /mnt
```


## Set the timezone

Set the timezone.

```
ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime
```


Then check if the timezone was correctly updated.

```
date
```


Finally sync the system time to the hardware clock.

```
hwclock --systohc
```


## Set the localization settings

Set the localization by editing the file.

```
nvim /etc/locale.gen
```


And uncomment the `en_US.UTF-8 UTF-8` localization.

Then generate the locales.

```
locale-gen
```


Now activate the locale.

```
nvim /etc/locale.conf
```


And write `LANG=en_US.UTF-8` and save the file.

To make the keyboard layout change persistent, edit the file.

```
nvim /etc/vconsole.conf
```


And write `KEYMAP=be-latin1`


## Network configuration

Set the hostname of the system

```
nvim /etc/hostname
```


And write the name of the system and save the file.


## Set the root password

Set the root password.

```
passwd
```


And enter a password.


## Create a new user

Then create a new user to avoid using the root user.

```
useradd -mG wheel -s /bin/zsh peakyhell
```


And set a password for the user

```
passwd peakyhell
```


Finally give sudo permission to the user.

```
EDITOR=nvim visudo
```


And uncomment the line `%wheel ALL=(ALL) ALL` and save the file.


## Enable Network Manager

Enable the network manager.

```
systemctl enable NetworkManager
```


## Configure systemd-boot

Ensure the system is booted in UEFI mode and that UEFI variables are accessible.
```
ls /sys/firmware/efi/efivars
```

If the directory exists, the system is booted in UEFI mode.


Install systemd-boot to the ESP.
```
bootctl install
```


Create a loader configuration at `/boot/loader/loader.conf`.
```
default arch.conf
timeout 5
console-mode max
editor no
```


Then create the Arch entry at `/boot/loader/entries/arch.conf`
```
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options root=UUID=xxx rw
```

Replace `xxx` with your root partition UUID. You can find it easily inside `/etc/fstab`


## Exit and reboot

Exit the system.

```
exit
```


And unmount all drives

```
umount -R /mnt
```


# Reboot

[Source](https://wiki.archlinux.org/title/Installation_guide#Reboot)

And finally reboot.

```
reboot
```


# Post-installation

[Source](https://wiki.archlinux.org/title/Installation_guide#Post-installation)

## Check internet connection

Verify the connection.

```
ping -c 5 ping.archlinux.org
```


## Install additional packages

Install additional packages.

```
sudo pacman -S base-devel fastfetch git kitty man-db man-pages openssh texinfo zsh-completions
```


## Dual Boot - Add Windows to system-d boot 

First, install `edk2-shell`.
```
sudo pacman -S edk2-shell
```

Then copy its EFI file to `boot` so that system-d boot can detect it.
```
sudo cp /usr/share/edk2-shell/x64/Shell.efi /boot/shellx64.efi
```

You can now reboot and enter the UEFI shell during the system-d prompt.

If the font is too big, you can resize it using `mode 80 50`

List the FS aliases using the `map` command.

Find the FileSystem containing the windows EFI by using the following commands.
```
FSX: # To access FileSystem X
dir # To list the content of the FileSystem
```

Once found, you can exit and go back to Arch.

You can now create a new system-d boot entry at `/boot/loader/entries/windows.conf` and put the following content.
```
title Windows
efi /shellx64.efi
options -nointerrupt -nomap -noversion XXXX:EFI\Microsoft\Boot\Bootmgfw.efi
```

Replace XXX with the alias previously found. (ex. HD0a66666a2, HD0b)

Finally, you can reboot.


## Secure Boot

Ensure Secure Boot is in Setup Mode.
```
bootctl
```

Install sbctl to setup Secure Boot.
```
sudo pacman -S sbctl
```

Check the Secure Boot status from sbctl. It should be disabled.
```
sbctl status
```

Create keys.
```
sudo sbctl create-keys
```

Enroll them with Microsoft's ones.
```
sudo sbctl enroll-keys -m
```

Then check the Secure Boot status again.
```
sbctl status
```

sbctl should now be marked as installed.

We now need to sign the boot files. First verify which ones.
```
sudo sbctl verify
```

Sign the files using the following command.
```
sudo sbctl verify | sed -E 's|^.* (/.+) is not signed$|sudo sbctl sign -s "\1"|e'
```

Check that everything was signed.
```
sudo sbctl verify
```

Reboot and check that everything works properly.
```
sudo sbctl status
```


# Hyprland installation

See [hyprland.md](Docs/hyprland.md)




# Dotfiles

## Install yay

Install Yay AUR Helper.

```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

## Install packages and dotfiles

Clone the dotfiles repo and start the install script.

```
https://github.com/PeakyHell/dotfiles.git
cd dotfiles
sh install.sh
```

Use the script to install the packages then to import the configuration files.

## Zsh config

Install OhMyZsh.

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Packages configuration

Read [Arch Linux Packages Config](Docs/arch_packages_config.md) to configure the packages.

## Final reboot

Reboot and DONE.
