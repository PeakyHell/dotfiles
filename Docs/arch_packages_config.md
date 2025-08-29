# Pacman packages

## amd-ucode

## base

## base-devel

## discord

Connect account

Add a `bind` in `hyprland.conf` (Done in dotfiles)

```
bind = $mainMod, D, exec, discord
```

## dunst

Import the configuration file.

```
mkdir -p /etc/dunst
cat Arch/etc/dunst/dunstrc | sudo tee /etc/dunst/dunstrc > /dev/null
```

Add an `exec-once` in `hyprland.conf` (Done in dotfiles)

```
exec-once = dunst
```

## efibootmgr

## egl-wayland

## fastfetch

Add `fastfetch` at the end of the .zshrc file. (Done in dotfiles)

```
cat fastfetch >> ~/.zshrc
```

## git

Import the configuration files.

```
cat Common/home/.gitconfig > ~/.gitconfig
cat Common/home/.gitignore > ~/.gitignore
```

## grub

## hypridle

Import the configuration file.

```
mkdir -p ~/.config/hypr
cat Arch/home/.config/hypr/hypridle.conf > ~/.config/hypr/hypridle.conf
```

Add an `exec-once` in `hyprland.conf` (Done in dotfiles)

```
exec-once = hypridle
```

## hyprland

Import the configuration file.

```
mkdir -p ~/.config/hypr
cat Arch/home/.config/hypr/hyprland.conf > ~/.config/hypr/hyprland.conf
```

TODO ADD REST OF CONFIGURATION

## hyprlock

Import the configuration file.

```
mkdir -p ~/.config/hypr
cat Arch/home/.config/hypr/hyprlock.conf > ~/.config/hypr/hyprlock.conf
```

Add a `bind` in `hyprland.conf` (Done in dotfiles)

```
bind = $mainMod, escape, exec, hyprlock
```

## hyprpaper

Import the configuration files and the wallpapers.

```
mkdir -p ~/.config/hypr
cat Arch/home/.config/hypr/hyprpaper.conf > ~/.config/hypr/hyprpaper.conf
cp -a Arch/home/.config/wallpapers/. ~/.config/wallpapers/
```

Add an `exec-once` in `hyprland.conf` (Done in dotfiles)

```
exec-once = hyprpaper
```

## hyprpolkitagent

Add an `exec-once` in `hyprland.conf` (Done in dotfiles)

```
exec-once = systemctl --user start hyprpolkitagent
```

## kitty

Import the configuration file.

```
mkdir -p ~/.config/kitty
cat Common/home/.config/kitty/kitty.conf > ~/.config/kitty/kitty.conf
```

## lib32-nvidia-utils

## libva-nvidia-driver

Add an `env` in `hyprland.conf` (Done in dotfiles)

```
env = NVD_BACKEND,direct
```

## linux

## linux-firmware

## man-db

## man-pages

## neovim

Import the configuration files.

```
mkdir -p ~/.config/nvim
cat Common/home/.config/nvim/init.lua > ~/.config/nvim/init.lua
cat Common/home/.config/nvim/lazy-lock.json > ~/.config/nvim/lazy-lock.json
```

## networkmanager

## noto-fonts

## nvidia-open

## nvidia-utils

## openssh

Import the configuration file.

```
cat home/.ssh/config > ~/.ssh/config
```

Generate ssh keys

```
ssh-keygen -t ed25519 -C "contact@peakyhell.com" -f "~/.ssh/id_ed25519_github"
```

Add the keys to Github/ssh servers.

Set ssh directory permissions.

```
chmod 700 ~/.ssh/
chmod 600 ~/.ssh/*
chmod 644 ~/.ssh/id_ed25519_github.pub
```

Test the connection to the hosts.

```
ssh -T git@github.com
```

## pacman

Import the configuration file.

```
sudo cat etc/pacman.conf > /etc/pacman.conf
```

## pavucontrol

## pipewire

## pipewire-pulse

## prismlauncher

## qt5-wayland

## qt6-wayland

## reflector

Backup the current mirrors list.

```
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
```

Fetch the top 10 fastest mirrors.

```
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

## sddm

## spotify-launcher

Connect account.

## steam

Connect account.
Steam > Settings > Compatibility > Proton Experimental

## sudo

## texinfo

## ttf-nerd-fonts-symbols-common

## ttf-noto-nerd

## ufw

Enable ufw

```
systemctl enable ufw.service
ufw enable
```

Configure it.

```
ufw default deny
ufw allow from 192.168.0.0
ufw limit ssh
ufw limit SSH
```

Check configuration.

```
ufw status
```

Expected :

```
Status: active

To                         Action      From
--                         ------      ----
Anywhere                   ALLOW       192.168.0.0/24
22                         LIMIT       Anywhere
SSH                        LIMIT       Anywhere
22 (v6)                    LIMIT       Anywhere (v6)
SSH (v6)                   LIMIT       Anywhere (v6)
```

## waybar

Import the configuration files.

```
mkdir -p ~/.config/waybar
cat Arch/home/.config/waybar/config > ~/.config/waybar/config
cat Arch/home/.config/waybar/style.css > ~/.config/waybar/style.css
```

Add an `exec-once` in `hyprland.conf` (Done in dotfiles)

```
exec-once = waybar
```

## wayland-protocols

## wireplumber

## wl-clipboard

## wofi

Import the configuration file.

```
mkdir -p ~/.config/wofi
cat Arch/home/.config/wofi/style.css > ~/.config/wofi/style.css
```

## xclip

## xdg-desktop-portal-gtk

## xdg-desktop-portal-hyprland

## xorg-xwayland

## zsh

Install Oh My Zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Import the configuration file.

```
cat home/.zshrc > ~/.zshrc
source ~/.zshrc
```

## zsh-autosuggestions

## zsh-completions


# Yay packages

## goxlr-utility

Add an `exec-once` in `hyprland.conf` (Done in dotfiles)

```
exec-once = goxlr-utility
```

## librewolf-bin

Plugins :
- uBlock Origin (should already be installed)
- SponsorBlock
- Bitwarden

Change search engine to StartPage

## yay

TODO
