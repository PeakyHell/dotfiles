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

## settings

Set MacOs settings

```
sh MacOs/settings.sh
```
