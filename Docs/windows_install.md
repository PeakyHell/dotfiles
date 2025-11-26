# Install Windows 11 without a Microsoft account

Follow the normal Windows 11 installation process until the Microsoft account log-in.

At this step, press `shift + F10` and enter the following command :
```
oobe\bypassnro
```

While the computer restarts, remove the ethernet cable. You will then be able to create a local account.

# Run Win11Debloat

```
& ([scriptblock]::Create((irm "https://debloat.raphi.re/")))
```

# Install WSL

1. Open a CMD and run :

```
wsl --install
```

2. Reboot

3. Install ArchLinux in WSL :

```
wsl.exe --install archlinux
```

4. Update pacman :

```
pacman -Syu
```

5. Install the minimum packages needed :

```
pacman -S git nvim gcc openssh
```

And import the Neovim config

# Install chocolatey

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```


# Install the necessary packages/softwares

Listed in [Chocolatey Packages](Windows/chocolatey.txt) and [Windows Apps](Windows/apps.txt)

# Verifications

- Open Nvidia Control Panel and ensure monitors have the correct refresh rate.
- Install Nvidia Drivers with Nvidia App
- Disable Mouse Acceleration and ensure speed is at the middle
- Disable unecessary apps from Start on boot (OneDrive, ...)
- Update PowerShell
- CMD settings > Defaults > Bell notification style = none
- Set Power Mode to "Best Performance" and disable Sleep mode after X minutes
- Settings > System > Storage > Advanced Storage Settings > Where new content is saved > New apps will save to : Set to HDD
