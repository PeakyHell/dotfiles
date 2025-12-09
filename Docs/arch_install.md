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
ping -c 5 archlinux.org
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
pacstrap -K /mnt base linux linux-firmware amd-ucode grub efibootmgr networkmanager neovim sudo zsh
```


If you're dual booting, also install :

```
pacstrap -K /mnt dosfstools mtools
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


And uncomment the `fr_BE.UTF-8 UTF-8` localization.

Then generate the locales.

```
locale-gen
```


Now activate the locale.

```
nvim /etc/locale.conf
```


And write `LANG=fr_BE.UTF-8` and save the file.

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


## Configure Grub

Enable the boot loader. Replace X with the disk name.

```
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB /dev/sdX
```


And configure it.

```
grub-mkconfig -o /boot/grub/grub.cfg
```


## Exit and reboot

Exit the system.

```
exit
```


And unmount all drives

```
umount -R /mnt
```




## Dual Boot - Add Windows to Grub

Edit the Grub configuration.

```
nvim /etc/default/grub
```


Increase the `GRUB_TIMEOUT` to 30 seconds for example to have the time to choose your OS.

Then uncomment the line `#GRUB_DISABLE_OS_PROBER=false` and save the file.

Install the following package.

```
sudo pacman -S os-prober
```


Update the Grub configuration.

```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```




# Reboot

[Source](https://wiki.archlinux.org/title/Installation_guide#Reboot)

And finally reboot.

```
reboot
```


### Note

If your system doesn't boot on Grub, ensure it is selected as the Boot Manager in the BIOS.




# Post-installation

[Source](https://wiki.archlinux.org/title/Installation_guide#Post-installation)

## Check internet connection

Verify the connection.

```
ping -c 5 archlinux.org
```


## Install additional packages

Install additional packages.

```
sudo pacman -S base-devel fastfetch git kitty man-db man-pages nvidia-open nvidia-utils openssh texinfo zsh-autosuggestions zsh-completions
```




# Hyprland installation

## Install the required packages

Install Hyprland and the required packages.

```
sudo pacman -S hypridle hyprland hyprlock hyprpaper sddm egl-wayland libva-nvidia-driver xorg-xwayland wayland-protocols dunst pavucontrol pipewire wireplumber xdg-desktop-portal-hyprland xdg-desktop-portal-gtk hyprpolkitagent qt5-wayland qt6-wayland noto-fonts

```

## Modeset and Early KMS configuration

Open nvidia confifg file.

```
sudo nvim /etc/modprobe.d/nvidia.conf
```

And add the following line to ensure modeset is enabled.

```
options nvidia_drm modeset=1
```

Open mkinitcpio config file.

```
sudo nvim /etc/mkinitcpio.conf
```

And add the following to the modules array to enable Early KMS

```
MODULES=(... nvidia nvidia_modeset nvidia_uvm nvidia_drm ...)
```

Rebuild the initramfs.

```
sudo mkinitcpio -P
```

Then reboot.

After rebooting, ensure that DRM is enabled.

```
sudo cat /sys/module/nvidia_drm/parameters/modeset
```

Verify it returns `Y`

## Last checks

Verify that the following services are enabled

```
nvidia-suspend.service
nvidia-hibernate.service
nvidia-resume.service
```

## Start the Display Manager

Start sddm.

```
sudo systemctl enable --now sddm
```

Hyprland is now accessible from sddm login.

## Configure wayland

Once in Hyprland replace the config file with the custom one.

TODO : XDPH config inside Hyprland config




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
