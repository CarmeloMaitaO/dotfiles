{ config, lib, pkgs, ... }:
{
  options = {
    bluetooth.enable = lib.mkEnableOption "Enables Bluetooth";
  };

  config = lib.mkIf config.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };
    services.blueman.enable = true;
  };
}
