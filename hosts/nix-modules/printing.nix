{ config, lib, pkgs, ... }:
{
  options = {
    printing.enable = lib.mkEnableOption "Enables everything necessary for printing"; # It just works
  };

  config = lib.mkIf config.printing.enable {
    # Printing 
    services.printing = {
      enable = true;
      drivers = with pkgs; [
        cups-filters
        cups-browsed
        gutenprint
        gutenprintBin
        hplip
        hplipWithPlugin
        postscript-lexmark
        samsung-unified-linux-driver
        splix
        foomatic-db
        foomatic-db-engine
        foomatic-db-ppds
        foomatic-db-nonfree
        foomatic-db-ppds-withNonfreeDb
        brlaser
        brgenml1lpr
        brgenml1cupswrapper
        cnijfilter2
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
      openFirewall = true;
    };
  };
}

