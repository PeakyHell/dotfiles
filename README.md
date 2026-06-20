# How To Use
1. Start by cloning the repo wherever you want.
```
git clone https://github.com/PeakyHell/dotfiles.git
```

2. Ensure **stow** is installed.

3. Stow the **Common** directory.
```
cd Common/
stow -t "$HOME" --adopt home
```

3. Stow your platform directory.
```
# Arch Linux
cd Arch/
sudo stow -t /etc --adopt etc
stow -t "$HOME" --adopt home

# MacOs
TODO

# Windows
TODO
```


# Files

<pre>
<strong>Arch</strong>
├── <strong>etc</strong>
│   ├── <strong>dunst</strong>
│   │   └── dunstrc
│   ├── pacman.conf
│   └── sddm.conf
└── <strong>home</strong>
    ├── <strong>conky</strong>
    │   └── conky.conf
    ├── <strong>hypr</strong>
    │   ├── hypridle.conf
    │   ├── hyprland.lua
    │   ├── hyprlock.conf
    │   └── hyprpaper.conf
    ├── <strong>wallpapers</strong>
    │   └── city-night.png
    ├── <strong>waybar</strong>
    │   ├── config
    │   └── style.css
    └── <strong>wofi</strong>
        └── style.css

<strong>Common</strong>
└── <strong>home</strong>
    ├── <strong>.config</strong>
    │   ├── <strong>fastfetch</strong>
    │   │   └── config.jsonc
    │   ├── <strong>kitty</strong>
    │   │   ├── Catppuccin-Macchiato.conf
    │   │   ├── Default.conf
    │   │   ├── kitty.conf
    │   │   └── Tokyo-Night.conf
    │   └── <strong>nvim</strong>
    │       ├── init.lua
    │       ├── <strong>lua</strong>
    │       │   ├── <strong>config</strong>
    │       │   │   └── options.lua
    │       │   └── <strong>plugins</strong>
    │       │       └── lsp.lua
    │       └── nvim-pack-lock.json
    ├── .gitconfig
    ├── .gitignore
    ├── <strong>.ssh</strong>
    │   └── config
    ├── .stow-local-ignore
    └── .zshrc

<strong>Docs</strong>
├── apps_packages_config.md
├── arch_install.md
├── hyprland.md
└── windows_install.md

<strong>MacOs</strong>

<strong>Scripts</strong>
├── arch_install.sh
├── arch_methods.sh
├── helper.sh
├── macos_methods.sh
└── windows_methods.sh

<strong>Windows</strong>
</pre>


# Arch Linux Installation

1. Read the [Arch installation guide](Docs/arch_install.md)

# Apps and packages configurations

View [Apps and packages configurations](Docs/apps_packages_config.md) for configuration instructions.

# TO BE REMOVED

---

# MacOs Packages (16)

## Formulaes (8)

| Name      | Description                               |
|-----------|-------------------------------------------|
| fastfetch | Terminal tool to show system informations |
| gcc       | Compiler                                  |
| git       | Version control                           |
| neovim    | NeoVim text editor                        |
| node      | Javascript environment                    |
| openjdk   | Java JDK                                  |
| python    | Python                                    |
| xclip     | Clipboard tool for X11                    |

## Casks (8)

| Name            | Description                                 |
|-----------------|---------------------------------------------|
| discord         | Discord                                     |
| docker-desktop  | Containering                                |
| kitty           | Terminal emulator                           |
| librewolf       | Web Browser                                 |
| obsidian        | Note taking                                 |
| protonvpn       | VPN                                         |
| scroll-reverser | Reverse trackpad and mouse scroll direction |
| spotify         | Spotify                                     |

# Windows Packages (9)

## Chocolatey (3)

| Name       | Description                           |
|------------|---------------------------------------|
| librewolf  | Web Browser                           |
| nvidia-app | Nvidia Drivers and Games optimization |
| spotify    | Spotify                               |

## Apps (6)

| Name                    | Description                        |
|-------------------------|------------------------------------|
| Discord                 | Discord                            |
| GoXLR App + Driver      | GoXLR Mini's App + Drivers         |
| Logitech GHUB           | Logitech Peripherals Customization |
| Riot Games Client       | Riot Games Client                  |
| Rockstar Games Launcher | Rockstar Games Launcher            |
| Steam                   | Steam                              |
