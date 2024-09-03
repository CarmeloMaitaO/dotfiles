{ config, lib, pkgs, ... }:

let
  cfg = config.desktopEssentials;
  cfgDE = config.desktopEnvironment;
in

with pkgs.lib; {
  options = {
    desktopEssentials = {

      flatpak = mkEnableOption "Enables Flatpak";
      audio = mkEnableOption "Enables Audio with Pipewire";
      graphics = mkEnableOption "Enables hardware accelerated graphics drivers for Intel CPUs";
      virtualisation = mkEnableOption "Enables QEMU/KVM and Waydroid";
      printing = mkEnableOption "Enables everything necessary to print/scan documents"; # it just works

    };

    desktopEnvironment = {
      budgie = "Enables the Budgie DE without its defaults programs";
      lightDM = "Enables LightDM";
    };
  };

  config = {

    # Budgie
    services.xserver.desktopManager = mkIf cfgDE.budgie {
      enable = true;
    };
    programs.dconf = mkIf cfgDE.budgie {
      enable = true;
    };
    environment.budgie = mkIf cfgDE.budgie {
      excludePackages = with pkgs; [
        vlc
	xterm
	mate.mate-terminal
	mate.nemo
	mate.pluma
	mate.atril
	mate.engrampa
	mate.mate-calc
	mate.mate-system-monitor
      ];
    };

    # LightDM
    services.xserver = mkIf cfgDE.lightDM {
      enable = true;
      displayManager.lightdm.enable = true;
    };
    
    # Flatpak
    services.flatpak = mkIf cfg.flatpak {
      enable = true;
    };

    # Audio
    hardware.pulseaudio = mkIf cfg.audio {
      enable = false;
    };
    security.rtkit = mkIf cfg.audio {
      enable = true;
    };
    services.pipewire = mkIf cfg.audio {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Graphics
    hardware.graphics = mkIf cfg.graphics {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        vpl-gpu-rt
	intel-media-sdk
	intel-vaapi-driver
	libvdpau-va-gl
      ];
      extraPackages32 = with pkgs; [
        intel-vaapi-driver
      ];
    };

    # Virtualisation
    virtualisation = mkIf cfg.virtualisation {
      kvmgt.enable = true;
      waydroid.enable = true;
      libvirtd.enable = true;
      virt-manager.enable = true;
    };

    # Printing 
    services.printing = mkIf cfg.printing {
      enable = true;
      drivers = [
        pkgs.gutenprint
        pkgs.gutenprintBin
        pkgs.hplip
        pkgs.hplipWithPlugin
        pkgs.postscript-lexmark
        pkgs.samsung-unified-linux-driver
        pkgs.splix
        pkgs.brlaser
        pkgs.brgenml1lpr
        pkgs.brgenml1cupswrapper
        pkgs.cnijfilter2
      ];
    };
    environment = mkIf cfg.printing {
      systemPackages = with pkgs; [
        simple-scan
      ];
    };
    hardware.sane = mkIf cfg.printing {
      enable = true;
      extraBackends = with pkgs; [
        sane-airscan
        hplipWithPlugin
        epkowa
        utsushi
      ];
    };
    services.udev = mkIf cfg.printing {
      packages = with pkgs; [
        utsushi
      ];
    };
    services.ipp-usb = mkIf cfg.printing {
      enable = true;
    };
    services.avahi = mkIf cfg.printing {
      enable = true;
      nssmdns4 = true;
    };

  };
}
