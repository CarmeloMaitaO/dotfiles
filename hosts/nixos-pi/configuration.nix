# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, modulesPath, ... }:
with pkgs; let
  patchDesktop = pkg: appName: from: to: lib.hiPrio (
    pkgs.runCommand "$patched-desktop-entry-for-${appName}" {} ''
    ${coreutils}/bin/mkdir -p $out/share/applications
    ${gnused}/bin/sed 's#${from}#${to}#g' < ${pkg}/share/applications/${appName}.desktop > $out/share/applications/${appName}.desktop
  '');
  GPUOffloadApp = pkg: desktopName: patchDesktop pkg desktopName "^Exec=" "Exec=nvidia-offload ";
in
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
    (GPUOffload (pkgs.alpaca.override { ollama = pkgs.ollama-cuda; }) "com.jeffser.Alpaca")
    (GPUOffload freetube "freetube")
    (GPUOffload penpot-desktop "Penpot")
    (GPUOffload clapper "com.github.rafostar.Clapper")
    clapper-enhancers
    vlc
    spotify
    (GPUOffload brave "brave-browser")
    (GPUOffload firefox "firefox")
    (GPUOffload opera "opera")
    foliate
    (GPUOffload blender "blender")
    varia
    gnucash
    (GPUOffload parabolic "org.nickvision.tubeconverter")
    (GPUOffload onlyoffice-desktopeditors "onlyoffice-desktopeditors")
    tor-browser
    eartag
    pika-backup
    gnome-secrets
    gnome-decoder
    (GPUOffload fontforge "fontforge")
    telegram-desktop
    anytype
    bottom
    carburetor
    (GPUOffload zoom-us "Zoom")
    dconf-editor
    ( GPUOffload (pkgs.retroarch.override {
     cores = with libretro; [
      melonds
      citra
      dolphin
      ppsspp
      beetle-psx-hw
      play
     ];
    }) "retroarch")
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-pi";

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      offload = {
        enable = true;
        enableOffloadCmd = true;
      }; # offload
    }; # prime
  }; # hardware.nvidia

  environment.variables = {
    EDITOR = "hx";
    VISUAL = "hx";
    PAGER = "less";
    BROWSER = "opera";
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
  steam-nvidia.enable = true;
  flatpak.enable = true;
  audio.enable = true;
  graphics.enable = true;
  virtualisation.enable = true;
  printing.enable = true;
  gnome.enable = true;

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
