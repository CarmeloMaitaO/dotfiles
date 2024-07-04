# Dotfiles

This is the flake I have prepared to handle both my own machine and the others
present at my house. It is divided in two categories of modules: `nixos` and
`home-manager`, the first containing global options and the latter containing
the specific configuration for each user.

**Dont forget to replace `hardware-configuration.nix` with your own if you plan
to use this flake**

## Nixos Modules

### de-budgie.nix

Enables the Budgie Desktop-Environment, dconf, excludes some packages and
installs:

- kitty: a terminal
- ydotool: a CLI tool to automate user input

### de-hyprland

Enables the Hyprland Windows-Manager and installs:

- rofi: an application launcher
- ags: a GTK shell that allows users to declare widgets using JS
- kitty: a terminal
- ydotool: a CLI tool to automate user input

### dm-lightdm.nix

Enables the LightDM Desktop-Manager.

### flatpak-conf.nix

Enables flatpak.

### i2p.nix

Creates a Systemd Nspawn container with its own private network that starts with
the host, in which runs the I2P service with the socks proxy enabled and Bandura
as the outproxy.

*This one's a WIP.*

### keymap-us.nix

Configures the keyboard for the US distribution (adjust for better
compatibility).

### locale-ve.nix

Adjust the system's locales for Venezuela.

### networking

Enables networking and configure the programs and interfaces related to this
matter.

### nix-settings.nix

Configure Nix to accept unfree, broken and insecure packages; enables nix
command and flakes; allows the nix store to optimise itself automatically.

### printing.nix

Enables the CUPS and SANE services, and installs a collection of drivers for
them. The objective for this is to not worry about installing new printer or
scanner drivers after enabling this module.

### qemu-conf.nix

Enables Libvirtd and Virt-manager to virtualise with QEMU-KVM.

### shell-zsh.nix

Enables the ZSH shell.

### sound.nix

Enables audio and Pipewire with Alsa/Pulseaudio support.

### video-conf.nix

Enables OpenGL.

### steam-conf

Enables Steam, GamescopeSession, Gamemode and sets the
STEAM\_EXTRA\_COMPAT\_TOOLS\_PATH environment variable.

### packages-\*.nix

All the files with the *packages* prefix only install programs associated with
the suffix. They are a way to organize the installation of packages for multiple
machines. Modify as you see fit.
