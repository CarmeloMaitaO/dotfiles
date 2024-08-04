{ config, lib, pkgs, ... }:
{
  config = {
    services.printing.enable = true;
    services.printing = {
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
    environment.systemPackages = with pkgs; [
      simple-scan
    ];

    hardware.sane.enable = true;
    services.ipp-usb.enable=true;
    hardware.sane.extraBackends = [
      pkgs.sane-airscan
      pkgs.hplipWithPlugin
      pkgs.epkowa
      pkgs.utsushi
    ];
    services.udev.packages = [
      pkgs.utsushi
    ];
    services.avahi.enable = true;
    services.avahi.nssmdns4 = true;
  };
}

