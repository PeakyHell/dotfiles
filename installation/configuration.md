## grub

TODO

## networkmanager

TODO

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


## zsh

Install Oh My Zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Move `.zshrc` into the home directory and source it.

```
cat home/.zshrc > ~/.zshrc
source ~/.zshrc
```


## dunst

Add an `exe-once` into hyprland.conf

```
exec-once = dunst
```

Copy the `dunstrc` config file.

```
cat etc/dunst/dunstrc > /etc/dunst/dunstrc
```

## hypridle

Add an `exe-once` into hyprland.conf

```
exec-once = hypridle
```

Copy the `hypridle.conf` config file.

```
cat home/.config/hypr/hypridle.conf > ~/.config/hypr/hypridle.conf
```

## hyprland

Tutorial in (Hyprland installation)[hyprland_install.md]

## hyprlock

Copy the `hyprlock.conf` config file.

```
cat home/.config/hypr/hyprlock.conf > ~/.config/hypr/hyprlock.conf
```

## hyprpaper

Add an `exe-once` into hyprland.conf

```
exec-once = hyprpaper
```

Copy the `hyprpaper.conf` config file.

```
cat home/.config/hypr/hyprpaper.conf > ~/.config/hypr/hyprpaper.conf
```

## hyprpolkitagent

Add an `exe-once` into hyprland.conf

```
exec-once = systemctl --user start hyprpolkitagent
```

## libva-nvidia-driver

Add an `env` into hyprland.conf

```
env = NVD_BACKEND,direct
```

## waybar

Add an `exec-once` into hyprland.conf

```
exec-once = waybar
```

Copy the `config` and `style.css` config files.

```
cat home/.config/waybar/config > ~/.config/waybar/config
cat home/.config/waybar/style.css > ~/.config/waybar/style.css
```

## wofi

Copy the `style.css` config file.

```
cat home/.config/wofi/style.css > ~/.config/wofi/style.css
```

## xdg-desktop-portal-gtk

TODO

## xdg-desktop-portal-hyprland

TODO

## git

Copy the `.gitconfig` config file.

```
cat home/.gitconfig > ~/.gitconfig
```

## kitty

Copy the `kitty.conf` config file.

```
cat home/.config/kitty/kitty.conf > ~/.config/kitty/kitty.conf
```

## neovim

Copy `init.lua` and `lazy-lock.json` config files.

```
cat home/.config/nvim/init.lua > ~/.config/nvim/init.lua
cat home/.confignvim/lazy-lock.json > ~/.config/nvim/lazy-lock.json
```

## ssh

Generate ssh keys

```
ssh-keygen -t ed25519 -C "contact@peakyhell.com" -f "~/.ssh/id_ed25519_github"
```

Copy `config` config file.

```
cat home/.ssh/config > ~/.ssh/config
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

## Pacman configuration

Copy `pacman.conf` config file.

```
sudo cat etc/pacman.conf > /etc/pacman.conf
```

Backup the current mirrors list.

```
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
```

Fetch the top 10 fastest mirrors.

```
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

## Update the system

Update the system and all the packages.

```
sudo pacman -Syu
```
