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
    helix
    git # SVC
    nitch # System fetch made in Nim
    ghostty # Terminal
    lazysql # TUI SQL database client
    yt-dlp # CLI to download multimedia from multiple services
    gnome-software # Software store for Flatpak
    pika-backup # Borg backup frontend
    gnome-secrets # Secrets manager
    aria2 # Download manager
    ffmpeg-full
    sops
    gnome-decoder # QR decoder and encoder
    killall
    tealdeer
    aichat # AI chat client
    nemu # TUI for QEMU
    bottom # System Monitor
    brave # Web browser
    bruno # API IDE
    bruno-cli # CLI API IDE
    carburetor # Tor proxy
    keypunch # Touch-typing tutor
    hashes # Hash identification GUI
    blender # 3D modelling software
    exhibit # Blender models viewer
    onlyoffice-desktopeditors # Office suite
    gnucash # Accounting software
    eartag # Music tagger
    dconf-editor # dconf explorer and editor
    clapper # Multimedia player
    clapper-enhancers
    cartridges # Game launcher
    collision # Compare hashes
    foliate # Ebook reader
    anytype # PKM
    adwsteamgtk # GTK for Steam
    freetube # Youtube client
    telegram-desktop # Chat app
    penpot-desktop # Figma alternative
    wf-recorder # Record desktop on Wayland
    exercism # CLI for Exercism.org
    jujutsu # VCS
    jjui # Jujutsu TUI
    lagrange
    lagrange-tui
    tree
    treecat
    prismlauncher
    packet
    d2
    gnome-frog
    imagemagick
    #(retroarch.override {
      #cores = with libretro; [
        #melonds
        #citra
        #dolphin
        #ppsspp
        #beetle-psx-hw
        #play
      #];
    #})
  ];

  boot.loader = {
    timeout = 5;
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      sortKey = "znixos";
      netbootxyz = {
        enable = true;
        sortKey = "zznetbootxyz";
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
  networking.enable = true;
  nixconf.enable = true;
  nushell.enable = true;
  starship.enable = true;
  steam.enable = true;
  flatpak.enable = true;
  audio.enable = true;
  graphics.enable = true;
  virtualisation.enable = true;
  printing.enable = true;
  gnome.enable = true;

 fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    corefonts
  ];

  stylix = {
    enable = true;
    image = inputs.bg-mountain;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 16;
    }; # cursor
    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif Light";
      }; # serif
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans Light";
      }; # sansSerif
      monospace = {
        package = pkgs._0xproto;
        name = "0xProto";
      }; # monospace
      emoji = {
        package = pkgs.noto-fonts-monochrome-emoji;
        name = "Noto Emoji";
      }; # emoji
    }; # fonts
  }; # stylix

  system.stateVersion = "24.11";
}
