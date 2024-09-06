{ config, lib, pkgs, ... }:
{
  options = {
    lightdm.enable = lib.mkEnableOption "Enables LightDM";
  };

  config = lib.mkIf config.lightdm.enable {
    # LightDM
    services.xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
    };
  };
}

