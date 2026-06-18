# Hyprland installation

## Install the required packages

Install Hyprland and the required packages.

Hyprland:
```
sudo pacman -S hyprland
```

Login manager (to launch Hyprland on startup):
```
sudo pacman -S sddm
```

Notification daemon:
```
sudo pacman -S dunst
```

Pipewire (required for screen sharing):
```
sudo pacman -S pipewire wireplumber
```

XDG Desktop Portal (+ file picker):
```
sudo pacman -S xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
```

Authentication Agent:
```
sudo pacman -S hyprpolkitagent
```

Qt Wayland Support:
```
sudo pacman -S qt5-wayland qt6-wayland
```

Fonts:
```
sudo pacman -S noto-fonts
```

Application launcher:
```
sudo pacman -S wofi
```

File manager:
```
sudo pacman -S dolphin
```

Status bar:
```
sudo pacman -S waybar
```

Clipboard:
```
sudo pacman -S wl-clipboard
```


## Install the not required but used packages
Idle manager
```
sudo pacman -S hypridle
```

Lock screen
```
sudo pacman -S hyprlock
```

Wallpapers manager
```
sudo pacman -S hyprpaper
```

Sound mixer
```
sudo pacman -S pavucontrol
```


# Nvidia Configuration

[Source](https://wiki.hypr.land/Nvidia/)

If you have a Nvidia GPU there are some more steps to ensure everything works properly.

## Install the required packages

Install the following packages and drivers.

```
sudo pacman -S libva-nvidia-driver nvidia-open nvidia-utils
```


## Install additional packages
Install the following packages that are useful to fix some potential issues.

Flickering in XWayland games
```
sudo pacman -S xorg-xwayland wayland-protocols
```

EGL - Wayland API compatibility
```
sudo pacman -S egl-wayland
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
MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
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

# Start the Display Manager

Start sddm.

```
sudo systemctl enable --now sddm
```

Hyprland is now accessible from sddm login.

# Configure wayland

Once in Hyprland replace the config file with the custom one.

TODO : XDPH config inside Hyprland config
