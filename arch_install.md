# Pre-installation

## Keyboard layout

Set belgian keyboard layout

```
loadkeys be-latin1
```

## Verify the boot mode

```
cat /sys/firmware/efi/fw_platform_size
```

Verify it returns `64`

## Connect to internet

Ensure the network interface is listed and enabled.

```
ip link
```

Verify the connection.

```
ping -c 5 archlinux.org
```

## Update the system clock

Ensure the system clock is correctly synced

```
timedatectl
```

## Partitioning the disk(s)

Use the `cfdisk` tool for a better experience.

```
cfdisk
```

Select the `gpt` label.

Free the necessary partitions then create the following partitions :

- 1G boot partition
- 16G swap partition
- Left space root partition

Then Write and Quit to go back to the terminal.

## Formatting and mounting the partitions

List all the partitions for easier formatting.

```
lsblk
```

Then format the partitions as follow (replace X with the disk name and Y with the partition number) :

### Formatting

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

### Mounting

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

Finally, use `lsblk` again to check if partition are correctly mounted.

# Installation

## Install the base system

Install the base packages to run the system properly.

```
pacstrap -K /mnt base linux linux-firmware amd-ucode grub efibootmgr networkmanager nvim zsh
```

# Configure the system

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

Finally set the hardware clock.

```
hwclock --systohc
```

## Set the localization

Set the localization by editing the file.

```
nvim /etc/locale.gen
```

And uncomment the `fr_BE.UTF-8 UTF-8` localization.

Then generate the locales.

```
locale-gen
```

Some program will check for the locale at another place.

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

Create a new user to avoid using the root user.

```
useradd -m -G wheel -s /bin/zsh peakyhell
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

## Enable core services

Enable the network manager.

```
systemctl enable NetworkManager
```

Enable the boot loader. Replace X with the disk name.

```
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
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

And FINALLY reboot.

```
reboot
```

# Post-installaation

## Check internet connection


Verify the connection.

```
ping -c 5 archlinux.org
```

## Install additional packages

Install additional packages.

```
sudo pacman -S base-devel fastfetch firefox git kitty man-db man-pages nvidia-open nvidia-utils openssh sof-firmware texinfo zsh-autosuggestions zsh-completions
```

# Hyprland installation

## Install the required packages

Install Hyprland and the required packages.

```
sudo pacman -S hyprland sddm lib32-nvidia-utils egl-wayland libva-nvidia-driver xorg-xwayland wayland-protocols dunst pipewire wireplumber xdg-desktop-portal-hyprland xdg-desktop-portal-gtk hyprpolkitagent qt5-wayland qt6-wayland noto-fonts

```

## Modeset and Early KMS configuration

Verify that the `/etc/modprobe.d/nvidia.conf` file contains the following line to ensure modeset is enabled.

```
options nvidia_drm modeset=1
```

Also enable Early KMS by editing `/etc/mkinitcpio.conf` and adding the following to the modules array:

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
cat /sys/module/nvidia_drm/parameters/modeset
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

# Final configuration

## Configuration

Import and setup the dotfiles and install the Pacman and Yay packages

## Packages configuration

For `dunst` move the config file from `/etc/xdg/dunst/dunstrc` to `.config/dunst/dunstrc`


## Update the system

Once finished, update the system and all the packages.

```
sudo pacman -Syu
```

# Informations

## Installed packages

- base, linux, linux-firmware : Kernel
- amd-ucode : Microcode updates for amd CPU
- grub : Bootloader
- efibootmgr : Used by grub to write boot entries to NVRAM
- networkmanager : Provides configuration for network interfaces
- neovim : NeoVim text editor
- zsh : The zsh shell

- base-devel : Base development packages
- fastfetch : Terminal tool to show system informations
- firefox : Web Browser
- git : Version control
- kitty : Terminal emulator
- man-db, man-pages : Man pages
- nvidia-open : Nvidia driver
- nvidia-utils : Nvidia drivers utilities
- openssh : Ssh usage and key management
- sof-firmware : Firmware for audio cards
- texinfo : GNU documentation
- zsh-autosuggestions : Automatically suggest commands for zsh
- zsh-completions : Zsh tab completion

- hyprland :
- sddm : The display manager
- lib32-nvidia-utils : Utilities for games
- egl-wayland : Enables compatibility between the EGL API and the Wayland protocol
- libva-nvidia-driver : Driver for Hardware Acceleration
- xorg-xwayland : Allows to run X apps in Wayland
- wayland-protocols : Add Wayland protocols not included in the core protocol
- dunst : Notification demon
- pipewire : Multimedia framework. Required for screensharing
- wireplumber : Session and policy manager for pipewire
- xdg-desktop-portal-hyprland : Allow apps to communicate with the compositor through D-Bus
- xdg-desktop-portal-gtk : File picker for XDPH
- hyprpolkitagent : Authentication agent
- qt5-wayland : Enables Wayland support in Qt
- qt6-wayland : Enables Wayland support in Qt
- noto-fonts : Nerd font

# TODO

- XDPH config inside Hyprland config
