# Formulaes

## fastfetch

Add `fastfetch` at the end of the .zshrc file.

```
cat fastfetch >> ~/.zshrc
```

## gcc

## git

Import the configuration files.

```
cat Common/home/.gitconfig > ~/.gitconfig
cat Common/home/.gitignore > ~/.gitignore
```

## homebrew

Install homebrew.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow installation and setup PATH variables.

Install packages.

```
brew bundle MacOs/Brewfile
```

## neovim

Import the configuration files.

```
mkdir -p ~/.config/nvim
cat Common/home/.config/nvim/init.lua > ~/.config/nvim/init.lua
cat Common/home/.config/nvim/lazy-lock.json > ~/.config/nvim/lazy-lock.json
```

## node

## openjdk

## python

## xclip


# Casks

## discord

Connect account

## docker-desktop

## kitty

Import the configuration file.

```
mkdir -p ~/.config/kitty
cat Common/home/.config/kitty/kitty.conf > ~/.config/kitty/kitty.conf
```

## librewolf

Plugins :
- uBlock Origin (should already be installed)
- SponsorBlock
- Bitwarden

Change search engine to StartPage

## obsidian

## protonvpn

## scroll-reverser

## spotify

Connect account.
