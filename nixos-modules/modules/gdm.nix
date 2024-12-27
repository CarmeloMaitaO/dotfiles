{ config, lib, pkgs, ... }:
{
  options = {
    gdm.enable = lib.mkEnableOption "Enables GDM";
  };

  config = lib.mkIf config.gdm.enable {
    # GDM
    services.xserver = {
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
  };
}
