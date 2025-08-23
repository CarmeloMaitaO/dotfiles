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
    looking-glass-client
    helix
    git # SVC
    nitch # System fetch made in Nim
    ghostty # Terminal
    yt-dlp # CLI to download multimedia from multiple services
    gnome-software # Software store for Flatpak
    aria2 # Download manager
    ffmpeg-full
    killall
    freetube
    penpot-desktop
    clapper
    clapper-enhancers
    vlc
    spotify
    brave
    foliate
    blender
    gnucash
    onlyoffice-desktopeditors
    tor-browser
    eartag
    pika-backup
    gnome-secrets
    gnome-decoder
    telegram-desktop
    anytype
    bottom
    carburetor
    zoom-us
    dconf-editor
    cartridges
    gnome-frog
    tree
    treecat
    eloquent
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
  boot.kernelModules = [
    "kvm-intel"
    "vfio_virqfd"
    "vfio_pci"
    "vfio_iommu_type1"
    "vfio"
    "v4l2loopback"
    "snd-aloop"
  ];
  boot.kernelParams = [
    "intel_iommu=on"
    "intel_iommu=pt"
    "kvm.ignore_msrs=1"
  ];
  #boot.extraModprobeConfig = "options vfio-pci ids=${builtins.concatStringsSep "," vfioIds}";
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    # exclusive_caps: Skype, Zoom, Teams etc. will only show device when actually streaming
    # card_label: Name of virtual camera, how it'll show up in Skype, Zoom, Teams
    # https://github.com/umlaeute/v4l2loopback
    options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
  '';
  systemd.tmpfiles.rules = [
    "f /dev/shm/looking-glass 0660 pi qemu-libvirtd -"
  ];


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
      sync.enable = true;
    }; # prime
  }; # hardware.nvidia

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
  steam-nvidia.enable = true;
  flatpak.enable = true;
  audio.enable = true;
  graphics.enable = true;
  printing.enable = true;
  gnome.enable = true;
  nixpkgsUnstable = {
    enable = true;
    packages = [
      "euphonica"
      "alpaca"
    ];
  };
  virtualisation = {
    kvmgt.enable = true;
    waydroid.enable = true;
    libvirtd = {
      enable = true;
      extraConfig =''
        user=pi
      '';
      onBoot = "ignore";
      onShutdown = "shutdown";
      qemu = {
        package = pkgs.qemu_kvm;
        verbatimConfig = ''
          namespaces = []
          user = "+${builtins.toString config.users.users.pi.uid}"
        '';
      };
    };
  };
  programs.virt-manager.enable = true;

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
