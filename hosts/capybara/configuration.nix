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
    git # SVC
    itch # Game store
    cartridges # Game library
    nitch # System fetch made in Nim
    openscad # CAD for modeling using descriptive geometry
    freecad # CAD for adicional functionality for Openscad
    rio # Terminal
    vesktop # Discord client
    telegram-desktop # Telegram client
    station # Web client for web apps
    qrrs # QR encoder and decoder
    pandoc # Document converter
    typst # Text macro-processor
    yt-dlp # CLI to download multimedia from multiple services
    foliate # Ebook reader
    gnucash # Accounting system
    prismlauncher # Minecraft launcher
    shattered-pixel-dungeon # Game
    dialect # Google translate client
    eartag # Metadata editor for audio files
    blender # Animation system
    monero-gui # Monero wallet
    cointop # Track cryptocurrencies prices
    clapper # Multimedia player
    gnome-software # Software store for Flatpak
    pika-backup # Borg backup frontend
    gnome-secrets # Secrets manager
    jan # FOSS offline ChatGPT alternative
    freetube # Youtube client
    aria2 # Download manager
    newsboat # RSS TUI Fetcher and Reader
    wiki-tui # TUI Client for Wikipedia
    termusic # TUI Music player
    firefox # Browser
    elinks # TUI browser with support for JS and multimedia
    aerc # TUI mail client
    harlequin # Database management TUI
    wtf # PI Dashboard
    calcure # Calendar and task manager
    tor-browser # Anonymous browser
    yazi # TUI file manager
    file-roller # GNOME archive manager
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Capybara";

  localeVE.enable = true;
  keymapUS.enable = true;
  networking.enable = true;
  nixconf.enable = true;
  fish.enable = true;
  steam.enable = true;
  flatpak.enable = true;
  audio.enable = true;
  graphics.enable = true;
  virtualisation.enable = true;
  printing.enable = true;
  budgie.enable = true;
  lightdm.enable = true;
  disableRPFilter.enable = true;

  stylix = {
    enable = true;
    image = inputs.bg-chiguire;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
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

  system.stateVersion = "23.11";
}
