# Hyprland installation

## Install the required packages

Install Hyprland and the required packages.

```
sudo pacman -S hyprland sddm egl-wayland libva-nvidia-driver xorg-xwayland wayland-protocols dunst pipewire wireplumber xdg-desktop-portal-hyprland xdg-desktop-portal-gtk hyprpolkitagent qt5-wayland qt6-wayland noto-fonts

```

## Modeset and Early KMS configuration

Verify that the `/etc/modprobe.d/nvidia.conf` file contains the following line to ensure modeset is enabled.

```
options nvidia_drm modeset=1
```

Also enable Early KMS by editing `/etc/mkinitcpio.conf` and adding the following to the modules array:

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
cat /sys/module/nvidia_drm/parameters/modeset
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

# TODO

- XDPH config inside Hyprland config
