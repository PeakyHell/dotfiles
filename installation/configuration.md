## Zsh configuration

First install Oh My Zsh.

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Then move the `.zshrc` file into the home directory and source it to configure Zsh.

```
cat home/.zshrc > ~/.zshrc
source ~/.zshrc
```

## Ssh configuration

First generate the required ssh keys.

```
ssh-keygen -t ed25519 -C "contact@peakyhell.com" -f "~/.ssh/id_ed25519_github"
```

Then import the ssh config file

```
cat home/.ssh/config > ~/.ssh/config
```

Then start the ssh-agent.

```
eval "$(ssh-agent -s)"
```

And add the keys to Github/the ssh servers

Ensure you set the correct permissions to the ssh directory

```
chmod 700 ~/.ssh/
chmod 600 ~/.ssh/*
chmod 644 ~/.ssh/id_ed25519_github.pub
```

Finally test the connections to the different hosts

```
ssh -T git@github.com
```

## Git configuration

Move the `.gitconfig` file into the home directory.

```
cat home.gitconfig > ~/.gitconfig
```

## NeoVim configuration

Move `init.lua` and `lazy-lock.json` into the config directory.

```
cat home/.config/nvim/init.lua > ~/.config/nvim/init.lua
cat home/.confignvim/lazy-lock.json > ~/.config/nvim/lazy-lock.json
```

## Packages configuration

For `dunst` move the config file from `/etc/xdg/dunst/dunstrc` to `.config/dunst/dunstrc`

## Update the system

Once finished, update the system and all the packages.

```
sudo pacman -Syu
```
