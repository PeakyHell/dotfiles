# Hyprland installation

## Install the required packages

Install Hyprland and the required packages.

```
sudo pacman -S hypridle hyprland hyprlock hyprpaper sddm egl-wayland xorg-xwayland wayland-protocols dunst pavucontrol pipewire wireplumber xdg-desktop-portal-hyprland xdg-desktop-portal-gtk hyprpolkitagent qt5-wayland qt6-wayland noto-fonts

```


# Nvidia Configuration

[Source](https://wiki.hypr.land/Nvidia/)

If you have a Nvidia GPU there are some more steps to ensure everything works properly.

## Install the required packages

Install the following packages and drivers.

```
sudo pacman -S libva-nvidia-driver nvidia-open nvidia-utils
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
MODULES=(... nvidia nvidia_modeset nvidia_uvm nvidia_drm ...)
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

## Start the Display Manager

Start sddm.

```
sudo systemctl enable --now sddm
```

Hyprland is now accessible from sddm login.

## Configure wayland

Once in Hyprland replace the config file with the custom one.

TODO : XDPH config inside Hyprland config
