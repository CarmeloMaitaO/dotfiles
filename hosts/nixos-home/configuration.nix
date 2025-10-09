# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, modulesPath, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  environment.systemPackages = with pkgs; [
    onefetch
    status-im
    p7zip-rar
    hextazy
    helix
    git # SVC
    nitch # System fetch made in Nim
    rio # Terminal
    sequeler
    yt-dlp # CLI to download multimedia from multiple services
    gnome-software # Software store for Flatpak
    pika-backup # Borg backup frontend
    gnome-secrets # Secrets manager
    aria2 # Download manager
    ffmpeg-full
    sops
    age
    gnome-decoder # QR decoder and encoder
    killall
    aichat # AI chat client
    bottom # System Monitor
    brave # Web browser
    chromium
    firefox
    keypunch # Touch-typing tutor
    blender # 3D modelling software
    exhibit # Blender models viewer
    onlyoffice-desktopeditors # Office suite
    eartag # Music tagger
    dconf-editor # dconf explorer and editor
    clapper # Multimedia player
    clapper-enhancers
    cartridges # Game launcher
    foliate # Ebook reader
    adwsteamgtk # GTK for Steam
    freetube # Youtube client
    telegram-desktop # Chat app
    jujutsu # VCS
    prismlauncher
    imagemagick
    eloquent
    hakuneko
    shattered-pixel-dungeon
    (retroarch.withCores (
     cores: with cores; [
      melonds
      citra
      dolphin
      ppsspp
      beetle-psx-hw
      play
     ]
    ))
  ];

  boot.loader = {
    timeout = 5;
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      sortKey = "1";
      netbootxyz = {
        enable = true;
        sortKey = "2";
      };
      edk2-uefi-shell = {
        enable = true;
        sortKey = "3";
      };
    };
  };
  boot.kernelModules = [ "kvm-intel" "v4l2loopback" "snd-aloop" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    # exclusive_caps: Skype, Zoom, Teams etc. will only show device when actually streaming
    # card_label: Name of virtual camera, how it'll show up in Skype, Zoom, Teams
    # https://github.com/umlaeute/v4l2loopback
    options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
  '';

  networking.hostName = "nixos-home";

  environment.variables = {
    EDITOR = "hx";
    VISUAL = "hx";
    PAGER = "less";
    BROWSER = "brave";
  };
  environment.sessionVariables = rec {
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";

    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [ 
      "${XDG_BIN_HOME}"
    ];
  };

  localeVE.enable = true;
  keymapUS.enable = true;
  net.enable = true;
  nixconf.enable = true;
  nushell.enable = true;
  starship.enable = true;
  steam.enable = true;
  flatpak.enable = true;
  audio.enable = true;
  graphics.enable = true;
  virtualisation.enable = true;
  i2pcontainer.enable = true;
  torcontainer.enable = true;
  printing.enable = true;
  gnome.enable = true;
  nixpkgsUnstable = {
    enable = true;
    packages = [
      "euphonica"
    ];
  };
  services.samba = {
    enable = true;
    smbd.enable = true;
  };

 fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    corefonts
  ];

  system.stateVersion = "25.05";
}
