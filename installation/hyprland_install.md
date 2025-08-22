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

# Informations

## Installed packages

- hyprland :
- sddm : The display manager
- (Removed) lib32-nvidia-utils : Utilities for games
- egl-wayland : Enables compatibility between the EGL API and the Wayland protocol
- libva-nvidia-driver : Driver for Hardware Acceleration
- xorg-xwayland : Allows to run X apps in Wayland
- wayland-protocols : Add Wayland protocols not included in the core protocol
- dunst : Notification demon
- pipewire : Multimedia framework. Required for screensharing
- wireplumber : Session and policy manager for pipewire
- xdg-desktop-portal-hyprland : Allow apps to communicate with the compositor through D-Bus
- xdg-desktop-portal-gtk : File picker for XDPH
- hyprpolkitagent : Authentication agent
- qt5-wayland : Enables Wayland support in Qt
- qt6-wayland : Enables Wayland support in Qt
- noto-fonts : Nerd font

# TODO

- XDPH config inside Hyprland config
