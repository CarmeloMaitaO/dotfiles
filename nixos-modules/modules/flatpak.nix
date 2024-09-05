{ config, lib, pkgs, ... }:

let
  cfg = config.flatpak;
in

with pkgs.lib; {
  options = {
    flatpak.enable = mkEnableOption "Enables flatpak";
  };

  config = mkIf cfg.enable {
    # Flatpak
    services.flatpak.enable = true;
  };
}

