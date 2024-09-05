{ config, lib, pkgs, ... }:

let
  cfg = config.lightdm;
in

with pkgs.lib; {
  options = {
    lightdm.enable = mkEnableOption "Enables LightDM";
  };

  config = mkIf cfg.enable {
    # LightDM
    services.xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
    };
  };
}

