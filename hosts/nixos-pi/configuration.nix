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
    yt-dlp # CLI to download multimedia from multiple services
    gnome-software # Software store for Flatpak
    aria2 # Download manager
    ffmpeg-full
    killall
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
      "flathub:app/com.authormore.penpotdesktop//stable"
      "flathub:app/de.capypara.FieldMonitor//stable"
      "flathub:app/eu.nokun.MirrorHall//stable"
      "flathub:app/com.spotify.Client//stable"
      "flathub:app/org.chromium.Chromium//stable"
      "flathub:app/org.shotcut.Shotcut//stable"
      "flathub:app/com.github.johnfactotum.Foliate//stable"
      "flathub:app/org.blender.Blender//stable"
      "flathub:app/io.github.giantpinkrobots.varia//stable"
      "flathub:app/org.gnucash.GnuCash//stable"
      "flathub:app/org.nickvision.tubeconverter//stable"
      "flathub:app/org.videolan.VLC//stable"
      "flathub:app/org.libreoffice.LibreOffice//stable"
      "flathub:app/com.opera.Opera//stable"
      "flathub:app/org.mozilla.firefox//stable"
      "flathub:app/org.torproject.torbrowser-launcher//stable"
      "flathub:app/app.drey.EarTag//stable"
      "flathub:app/org.gnome.World.PikaBackup//stable"
      "flathub:app/org.gnome.World.Secrets//stable"
      "flathub:app/com.belmoussaoui.Decoder//stable"
      "flathub:app/org.fontforge.FontForge//stable"
      "flathub:app/com.discordapp.Discord//stable"
      "flathub:app/org.telegram.desktop//stable"
      "flathub:app/us.zoom.Zoom//stable"
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
