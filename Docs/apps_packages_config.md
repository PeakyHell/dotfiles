## Proton VPN

Connect account.
Choose a server.

### Arch Linux Specific

Add an `exec-once` in `hyprland.conf` (Done in dotfiles)

```
exec-once = protonvpn-app
```

Setup keyring on first start.


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

Connect your account.


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


## firefox
**Description**
Firefox web browser

**Installation**
```
sudo pacman -S firefox
```

**Configuration**
Install the following plugins :
- uBlock Origin (should already be installed)
- SponsorBlock
- Bitwarden

Change search engine to StartPage


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


## goxlr-utility
**Description**

**Installation**
```
yay -S goxlr-utility
```

**Configuration**
Add an `exec-cmd` in `hyprland.conf` (Done in dotfiles)
```
hl.on("hyprland.start", function () 
  hl.exec_cmd("goxlr-utility")
end)
```

Set the following settings in GoXLR.
*Mic Setup*
- Dynamic
- 62dB

*Gate*
- Threshold : -40db
- Attenuation : 50%
- Attack : 10ms
- Release : 200ms

*Equalizer*
- 50Hz : -7
- 200Hz : 0
- 500Hz : -2
- 1.5kHz : 1
- 3.5kHz : 1
- 10.0kHz : -3

*Compressor*
- Threshold : -15dB
- Ratio : 3.2:1
- Attack : 2ms
- Release : 100ms
- Make-up Gain : 5dB


## hypridle
**Description**
Idle manager for Hyprland. Lock the system when idle.

**Installation**
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


## hyprland
**Description**
Dynamic tiling Wayland compositor.

**Installation**
```
sudo pacman -S hyprland
```

**Configuration**
Import the configuration file.
```
cat Arch/home/.config/hypr/hyprland.conf > ~/.config/hypr/hyprland.conf
```

Follow the instructions in the [Hyprland Docs](hyprland.md)


## hyprlock
**Description**
Lock screen for Hyprland.

**Installation**
```
sudo pacman -S hyprlock
```

**Configuration**
Import the configuration file.
```
cat Arch/home/.config/hypr/hyprlock.conf > ~/.config/hypr/hyprlock.conf
```

Add a `bind` in `hyprland.conf` (Done in dotfiles)
```
hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd("hyprlock"))
```


## hyprpaper
**Description**
Wallpaper manager for Hyprland.

**Installation**
```
sudo pacman -S hyprpaper
```

**Configuration**
Import the configuration files and the wallpapers.
```
cat Arch/home/.config/hypr/hyprpaper.conf > ~/.config/hypr/hyprpaper.conf
cp -a Arch/home/.config/wallpapers/. ~/.config/wallpapers/
```

Add an `exec-cmd` in `hyprland.conf` (Done in dotfiles)
```
hl.on("hyprland.start", function () 
  hl.exec_cmd("hyprpaper")
end)
```


## hyprpolkitagent
**Description**
Authentication daemon for Hyprland.

**Installation**
```
sudo pacman -S hyprpolkitagent
```

**Configuration**
Add an `exec-cmd` in `hyprland.conf` (Done in dotfiles)
```
exec-once = 
hl.on("hyprland.start", function () 
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)
```


## kitty
**Description**
Terminal emulmator.

**Installation**
```
sudo pacman -S kitty
```

**Configuration**
Import the confifuration file.
```
cat Common/home/.config/kitty/kitty.conf > ~/.config/kitty/kitty.conf
```


## lib32-nvidia-utils
**Description**
Nvidia drivers utilities for 32-bits apps.
Needed by Steam (Proton/Wine/...).

**Installation**
```
sudo pacman -S lib32-nvidia-utils
```

**Configuration**
Nothing to do.


## librewolf
**Description**
Hardened Firefox web browser

**Installation**
```
yay -S librewolf-bin
```

**Configuration**
Install the following plugins :
- uBlock Origin (should already be installed)
- SponsorBlock
- Bitwarden

Change search engine to StartPage


## libva-nvidia-driver
**Description**
Nvidia driver used for hardware video acceleration.
Needed by Hyprland.

**Installation**
```
sudo pacman -S libva-nvidia-driver
```

**Configuration**
Add an `env` in `hyprland.conf` (Done in dotfiles)
```
hl.env("NVD_BACKEND", "direct")
```


## linux
**Description**
The Linux kernel and modules.

**Installation**
```
sudo pacman -S linux
```

**Configuration**
Nothing to do.


## linux-firmware
**Description**
Firmware files for Linux.

**Installation**
```
sudo pacman -S linux-firmware
```

**Configuration**
Nothing to do.


## man-db
**Description**
Utility for reading man pages.

**Installation**
```
sudo pacman -S man-db
```

**Configuration**
Nothing to do.

## man-pages
**Description**
Linux man pages.

**Installation**
```
sudo pacman -S man-pages
```

**Configuration**
Nothing to do.


## neovim
**Description**
Text editor.

**Installation**
```
sudo pacman -S neovim
```

**Configuration**
Import the configuration files.
```
cat Common/home/.config/nvim/init.lua > ~/.config/nvim/init.lua
cat Common/home/.config/nvim/lazy-lock.json > ~/.config/nvim/lazy-lock.json
```


## networkmanager
**Description**
Network connection manager.

**Installation**
```
sudo pacman -S networkmanager
```

**Configuration**
Enabled during initial Arch install.
```
systemctl enable NetworkManager
```


## noto-fonts
**Description**
Google's Noto Fonts

**Installation**
```
sudo pacman -S noto-fonts
```

**Configuration**
Nothing to do.


## nvidia-open
**Description**
Nvidia open kernel modules.
Needed by Hyprland to work with Nvidia GPU.

**Installation**
```
sudo pacman -S nvidia-open
```

**Configuration**
Nothing to do.


## nvidia-utils
**Description**
Nvidia drivers utilities.
Needed by Hyprland to work with Nvidia GPU.

**Installation**
```
sudo pacman -S nvidia-utils
```

**Configuration**
Nothing to do.


## openssh
**Description**
SSH implementation.

**Installation**
```
sudo pacman -S openssh
```

**Configuration**
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
**Description**
Arch Linux package manager.

**Installation**
Already installed.

**Configuration**
Import the configuration file.
```
sudo cat etc/pacman.conf > /etc/pacman.conf
```


## pavucontrol
**Description**
PulseAudio volume control GUI.
Used inside waybar.

**Installation**
```
sudo pacman -S pavucontrol
```

**Configuration**
Nothing to do. Already added inside Waybar configuration.


## pipewire
**Description**
Audio/Video router and processor. Audio server.

**Installation**
```
sudo pacman -S pipewire
```

**Configuration**
Ensure the pipewire service is enabled.
```
systemctl --user status pipewire
```


## pipewire-pulse
**Description**
API/Interface between apps and pipewire. Replacing PulseAudio.

**Installation**
```
sudo pacman -S pipewire-pulse
```

**Configuration**
Ensure the pipewire-pulse service is enabled.
```
systemctl --user status pipewire-pulse
```


## prismlauncher
**Description**
Open source Minecraft launcher.

**Installation**
```
sudo pacman -S prismlauncher
```

**Configuration**
Connect your Microsoft account.


## qt5-wayland
**Description**
APIs for Wayland.
Needed by Hyprland.

**Installation**
```
sudo pacman -S qt5-wayland
```

**Configuration**
Nothind to do.


## qt6-wayland
**Description**
APIs for Wayland.
Needed by Hyprland.

**Installation**
```
sudo pacman -S qt6-wayland
```

**Configuration**
Nothind to do.


## reflector
**Description**
Module and script to find the best Pacman mirrors.

**Installation**
```
sudo pacman -S reflector
```

**Configuration**
Backup the current mirrors list.
```
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
```

Fetch the top 10 fastest mirrors.
```
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```


## sbctl
**Description**
Secure Boot key manager.
Used to enable Secure Boot on Arch and Windows together.

**Installation**
```
sudo pacman -S sbctl
```

**Configuration**
Nothing to do. Only used during Secure Boot setup.


## sddm
**Description**
Display manager/login manager.

**Installation**
```
sudo pacman -S sddm
```

**Configuration**
Import the configuration file.
```
cat Arch/etc/sddm.conf | sudo tee /etc/sddm.conf > /dev/null
```


## spotify-launcher
**Description**
Spotify launcher.

**Installation**
```
sudo pacman -S spotify-launcher
```

**Configuration**
Connect your Spotify account.


## steam
**Description**
Steam.

**Installation**
```
sudo pacman -S steam
```

**Configuration**
Connect your Steam account.
Enable Proton :
```
Steam > Settings > Compatibility > Proton Experimental
```


## sudo
**Description**
Gives ability to run commands as root.

**Installation**
```
sudo pacman -S sudo
```

**Configuration**
Nothing to do.


## texinfo
**Description**
Official GNU documentation.

**Installation**
```
sudo pacman -S texinfo
```

**Configuration**
Nothing to do.


## ttf-nerd-fonts-symbols
**Description**
Extra glyphs from popular fonts.

**Installation**
```
sudo pacman -S ttf-nerd-fonts-symbols
```

**Configuration**
Nothing to do.


## ttf-noto-nerd
**Description**
Patched Noto nerd font

**Installation**
```
sudo pacman -S ttf-noto-nerd
```

**Configuration**
Nothing to do.


## ufw
**Description**
Uncomplicated FireWall.

**Installation**
```
sudo pacman -S ufw
```

**Configuration**
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


## waybar
**Description**
Wayland bar.
ttf packages are needed to use icons.

**Installation**
```
sudo pacman -S waybar
```

**Configuration**
Import the configuration files.
```
cat Arch/home/.config/waybar/config > ~/.config/waybar/config
cat Arch/home/.config/waybar/style.css > ~/.config/waybar/style.css
```

Add an `exec-cmd` in `hyprland.conf` (Done in dotfiles)
```
hl.on("hyprland.start", function () 
  hl.exec_cmd("waybar")
end)
```


## wayland-protocols
**Description**
Extended Wayland protocols.
Needed by Hyprland for Nvidia to fix flickering in XWayland games.

**Installation**
```
sudo pacman -S wayland-protocols
```

**Configuration**
Nothing to do.


## wireplumber
**Description**
Session manager for pipewire.

**Installation**
```
sudo pacman -S wireplumber
```

**Configuration**
Ensure the wireplumber service is enabled.
```
systemctl --user status wireplumber
```


## wl-clipboard
**Description**
Command-line copy/paste utilities for Wayland.

**Installation**
```
sudo pacman -S wl-clipboard
```

**Configuration**
Nothing to do.


## wofi
Install Wofi.
```
sudo pacman -S wofi
```

Import the configuration file.

```
mkdir -p ~/.config/wofi
cat Arch/home/.config/wofi/style.css > ~/.config/wofi/style.css
```


## xdg-desktop-portal
**Description**
Desktop integration portals.
(General one)

**Installation**

**Configuration**


## xdg-desktop-portal-gtk
**Description**
Portal implementing file picker .
Needed by Hyprland.
(Fallback one)

**Installation**
```
sudo pacman -S xdg-desktop-portal-gtk
```

**Configuration**


## xdg-desktop-portal-hyprland
**Description**
Portal implementing useful functionalities (screensharing, shortcuts, ...)
Needed by Hyprland.
(Hyprland backend)

**Installation**
```
sudo pacman -S xdg-desktop-portal-hyprland
```

**Configuration**


## xorg-xwayland
**Description**
Run X clients under Wayland.
Needed by Hyprland for Nvidia to fix flickering in XWayland games.

**Installation**
```
sudo pacman -S xorg-xwayland
```

**Configuration**
Nothing to do.


## yay
**Description**
Pacman wrapper for AUR.

**Installation**
```
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

**Configuration**
Nothing to do.


## zsh
**Description**
Command interpreter.

**Installation**
```
sudo pacman -S zsh
```

**Configuration**
Import the configuration file.
```
cat home/.zshrc > ~/.zshrc
source ~/.zshrc
```

Install Oh My Zsh.
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

And install the plugins.
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```


## zsh-autosuggestions
**Description**
Autosuggestions for zsh.

**Installation**
```
sudo pacman -S zsh-autosuggestions
```

**Configuration**


## zsh-completions
**Description**
Command completions for zsh.

**Installation**
```
sudo pacman -S zsh-completions
```

**Configuration**




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
