{ config, lib, pkgs, ... }:

let
  cfg = config.printing;
in

with pkgs.lib; {
  options = {
    printing.enable = mkEnableOption "Enables everything necessary for printing"; # It just works
  };

  config = mkIf cfg.enable {
    # Printing 
    services.printing = {
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
    environment = {
      systemPackages = with pkgs; [
        simple-scan
      ];
    };
    hardware.sane = {
      enable = true;
      extraBackends = with pkgs; [
        sane-airscan
        hplipWithPlugin
        epkowa
        utsushi
      ];
    };
    services.udev = {
      packages = with pkgs; [
        utsushi
      ];
    };
    services.ipp-usb = {
      enable = true;
    };
    services.avahi = {
      enable = true;
      nssmdns4 = true;
    };
  };
}

