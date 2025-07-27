# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, modulesPath, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
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
      windows."Windows-11" = {
        title = "Windows 11";
        sortKey = "0";
        efiDeviceHandle = "HD0a65535a1";
      };
      edk2-uefi-shell = {
        enable = true;
        sortKey = "3";
      };
    };
  };

  networking.hostName = "nixos-work"; # Define your hostname.

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "latam";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "la-latin1";

  environment.systemPackages = with pkgs; [
    helix
    git # SVC
    nitch # System fetch made in Nim
    ghostty # Terminal
    pandoc # Document converter
    typst # Text macro-processor
    yt-dlp # CLI to download multimedia from multiple services
    foliate # Ebook reader
    pika-backup # Borg backup frontend
    gnome-secrets # Secrets manager
    freetube # Youtube client
    aria2 # Download manager
    brave # Browser
    gnome-decoder # QR decoder and encoder
    killall
    tealdeer
    bottom
    carburetor
    hashes
    onlyoffice-desktopeditors
    dconf-editor
    clapper
    clapper-enhancers
    collision
    tree
    treecat
    gnome-frog
  ];

  localeVE.enable = true;
  networking.enable = true;
  nixconf.enable = true;
  nushell.enable = true;
  starship.enable = true;
  flatpak.enable = true;
  audio.enable = true;
  graphics.enable = true;
  virtualisation.enable = true;
  printing.enable = true;
  gnome.enable = true;

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

  system.stateVersion = "25.05"; # Did you read the comment?

}
