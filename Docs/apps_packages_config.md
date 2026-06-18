**Description**

**Installation**

**Configuration**



# Common

## Discord
Install discord.
```
sudo pacman -S discord
```

Connect account

### Arch Linux Specific

Add the following line to `~/.config/discord/settings.json` to be able to start it when new updates aren't available yet.

```
"SKIP_HOST_UPDATE": true
```

Add a `bind` in `hyprland.conf` (Done in dotfiles)

```
bind = $mainMod, D, exec, discord
```

## Fastfetch
Install Fastfetch.
```
sudo pacman -S fastfetch
```

Add `fastfetch` at the end of the .zshrc file. (Done in dotfiles)

```
cat fastfetch >> ~/.zshrc
```

## Git
Install Git.

```
sudo pacman -S git
```

Import the configuration files.

```
cat Common/home/.gitconfig > ~/.gitconfig
cat Common/home/.gitignore > ~/.gitignore
```

## GoXLR App

Set the following settings.

#### Mic Setup

- Dynamic
- 62dB

#### Gate

- Threshold : -40db
- Attenuation : 50%
- Attack : 10ms
- Release : 200ms

#### Equalizer

- 50Hz : -7
- 200Hz : 0
- 500Hz : -2
- 1.5kHz : 1
- 3.5kHz : 1
- 10.0kHz : -3

#### Compressor

- Threshold : -15dB
- Ratio : 3.2:1
- Attack : 2ms
- Release : 100ms
- Make-up Gain : 5dB

### Arch Linux Specific

Add an `exec-once` in `hyprland.conf` (Done in dotfiles)

```
exec-once = goxlr-utility
```

## Kitty
Install Kitty.
```
sudo pacman -S kitty
```

Import the configuration file.

```
mkdir -p ~/.config/kitty
cat Common/home/.config/kitty/kitty.conf > ~/.config/kitty/kitty.conf
```

## Librewolf

Plugins :
- uBlock Origin (should already be installed)
- SponsorBlock
- Bitwarden

Change search engine to StartPage

## Neovim

Import the configuration files.

```
mkdir -p ~/.config/nvim
cat Common/home/.config/nvim/init.lua > ~/.config/nvim/init.lua
cat Common/home/.config/nvim/lazy-lock.json > ~/.config/nvim/lazy-lock.json
```

## OpenSSH

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

## Proton VPN

Connect account.
Choose a server.

### Arch Linux Specific

Add an `exec-once` in `hyprland.conf` (Done in dotfiles)

```
exec-once = protonvpn-app
```

Setup keyring on first start.

## Spotify

Connect account.

## Steam

Connect account.
Steam > Settings > Compatibility > Proton Experimental

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

And the plugins.
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```


# Arch Linux Only
## amd-ucode
**Description**
Microcode for AMD CPUs.

**Installation**
```
sudo pacman -S amd-ucode
```

**Configuration**
Nothing to do.


## base
**Description**
Minimal package set to define a basic Arch Linux installation.

**Installation**
```
sudo pacman -S base
```

**Configuration**
Nothing to do.


## base-devel
**Description**
Basic tools to build Arch Linux packages.

**Installation**
```
sudo pacman -S base-devel
```

**Configuration**
Nothing to do.


## conky
**Description**
System monitor.

**Installation**
```
sudo pacman -S conky
```

**Configuration**
Import the configuration file.

```
mkdir -p ~/.config/conky
cat Arch/home/.config/conky/conky.conf > ~/.config/conky/conky.conf
```


## discord
**Description**
Not needed

**Installation**
```
sudo pacman -S discord
```

**Configuration**
Add the following line to `~/.config/discord/settings.json` to be able to start it when new updates aren't available yet.

```
"SKIP_HOST_UPDATE": true
```

Add a `bind` in `hyprland.conf` (Done in dotfiles)

```
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("discord"))
```


## dolphin
**Description**
File manager.
Used by Hyprland.

**Installation**
```
sudo pacman -S dolphin
```

**Configuration**
Add a `variable` in `hyprland.conf` (Done in dotfiles)

```
local fileManager = "dolphin"
```


## dunst
**Description**
Notification daemon.

**Installation**
```
sudo pacman -S dunst
```

**Configuration**
Import the configuration file.

```
mkdir -p /etc/dunst
cat Arch/etc/dunst/dunstrc | sudo tee /etc/dunst/dunstrc > /dev/null
```

Add an `exec-cmd` in `hyprland.conf` (Done in dotfiles)

```
hl.on("hyprland.start", function () 
  hl.exec_cmd("dunst")
end)
```


## edk2-shell
**Description**
UEFI Shell.
Used to configure Arch-Windows dual boot.

**Installation**
```
sudo pacman -S edk2-shell
```

**Configuration**
Nothing to do. Only used during dual boot setup.


## egl-wayland
**Description**
Required in order to enable compatibility between the EGL API and the Wayland protocol.
Used for Nvidia with Hyprland.

**Installation**
```
sudo pacman -S egl-wayland
```

**Configuration**
Nothing to do.


## fastfetch
**Description**
Terminal system information tool.
Used in zsh.

**Installation**
```
sudo pacman -S fastfetch
```

**Configuration**
Add `fastfetch` at the end of the `.zshrc` file.
Default config is enough but Fastfetch can be configured in `~/.config/fastfetch/config.jsonc`


## git
**Description**
Version Control System

**Installation**
```
sudo pacman -S git
```

**Configuration**
Import the configuration files.
```
cat Common/home/.gitconfig > ~/.gitconfig
cat Common/home/.gitignore > ~/.gitignore
```

See openssh configuration for SSH keys configuration.


## Hypridle
**Description**
Idle manager.

**Installation**
Install Hypridle.
```
sudo pacman -S hypridle
```

**Configuration**
Import the configuration file.

```
cat Arch/home/.config/hypr/hypridle.conf > ~/.config/hypr/hypridle.conf
```

Add an `exec-cmd` in `hyprland.conf` (Done in dotfiles)

```
hl.on("hyprland.start", function () 
  hl.exec_cmd("hypridle")
end)
```

## Hyprland
Install Hyprland.
```
sudo pacman -S hyprland
```

Import the configuration file.

```
mkdir -p ~/.config/hypr
cat Arch/home/.config/hypr/hyprland.conf > ~/.config/hypr/hyprland.conf
```

Follow the instructions in the [Hyprland Docs](hyprland.md)

## Hyprlock
```
sudo pacman -S hyprlock
```

Import the configuration file.

```
mkdir -p ~/.config/hypr
cat Arch/home/.config/hypr/hyprlock.conf > ~/.config/hypr/hyprlock.conf
```

Add a `bind` in `hyprland.conf` (Done in dotfiles)

```
bind = $mainMod, escape, exec, hyprlock
```

## Hyprpaper
```
sudo pacman -S hyprpaper
```

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

## Hyprpolkitagent
Install Hyprpolkitagent.
```
sudo pacman -S hyprpolkitagent
```

Add an `exec-once` in `hyprland.conf` (Done in dotfiles)

```
exec-once = systemctl --user start hyprpolkitagent
```


## libva-nvidia-driver
Install libva-nvidia-driver.
```
sudo pacman -S libva-nvidia-driver
```

Add an `env` in `hyprland.conf` (Done in dotfiles)

```
env = NVD_BACKEND,direct
```

## Pacman

Import the configuration file.

```
sudo cat etc/pacman.conf > /etc/pacman.conf
```

## Reflector
Install Reflector.
```
sudo pacman -S reflector
```

Backup the current mirrors list.

```
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
```

Fetch the top 10 fastest mirrors.

```
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

## ufw
Install ufw.
```
sudo pacman -S ufw
```

Enable ufw

```
sudo systemctl enable ufw.service
sudo ufw enable
```

Configure it.

```
sudo ufw default deny
sudo ufw allow from 192.168.0.0
sudo ufw limit ssh
sudo ufw limit SSH
```

Check configuration.

```
sudo ufw status
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

## Waybar
Install Waybar as well as noto fonts symbols
```
sudo pacman -S waybar ttf-nerd-fonts-symbols ttf-noto-nerd
```

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

## Wofi
Install Wofi.
```
sudo pacman -S wofi
```

Import the configuration file.

```
mkdir -p ~/.config/wofi
cat Arch/home/.config/wofi/style.css > ~/.config/wofi/style.css
```

## Yay
Install Yay.
```
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```


# MacOs Only

## Homebrew

Install homebrew.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow installation and setup PATH variables.

Install packages.

```
brew bundle MacOs/Brewfile
```


# Windows Only
