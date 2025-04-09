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
    #cartridges # Game library
    nitch # System fetch made in Nim
    ghostty # Terminal
    vesktop # Discord client
    telegram-desktop # Telegram client
    yt-dlp # CLI to download multimedia from multiple services
    varia # GUI download manager
    zoom-us # Videoconferencing tool
    foliate # Ebook reader
    gnucash # Accounting system
    #modrinth-app # Minecraft launcher
    #shattered-pixel-dungeon # Game
    dialect # Google translate client
    eartag # Metadata editor for audio files
    blender # Animation system
    gnome-software # Software store for Flatpak
    pika-backup # Borg backup frontend
    gnome-secrets # Secrets manager
    aria2 # Download manager
    ffmpeg-full
    clapper
    vlc
    libreoffice
    pitivi
    parabolic
    newsflash
    footage
    blanket
    warp
    citations
    conjure
    inkscape
    krita
    switcheroo
    fontforge
    chromium # Browser
    opera # Browser
    firefox # Browser
    tor-browser # Anonymous browser
    gnome-decoder # QR decoder and encoder
    killall
    tealdeer
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

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-pi";

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

  services.flatpak = {
    enableModule = true;
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
    packages = [
      "flathub:app/com.jeffser.Alpaca//stable"
      "flathub:app/io.freetubeapp.FreeTube//stable"
      #"flathub:app/com.pokemmo.PokeMMO//stable"
      "flathub:app/com.authormore.penpotdesktop//stable"
      "flathub:app/de.capypara.FieldMonitor//stable"
      "flathub:app/eu.nokun.MirrorHall//stable"
      "flathub:app/com.spotify.Client//stable"
    ];
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    corefonts
  ];

  services.locate = {
    enable = true;
    package = pkgs.plocate;
    interval = "02:15";
    localuser = null;
  };

  stylix = {
    enable = true;
    image = inputs.bg-pi;
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
