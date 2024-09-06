{ config, lib, pkgs, ... }:
{
  options = {
    lightdm.enable = lib.mkEnableOption "Enables LightDM";
  };

  config = mkIf config.lightdm.enable {
    # LightDM
    services.xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
    };
  };
}

