{ config, lib, pkgs, ... }:
{
  options = {
    flatpak.enable = lib.mkEnableOption "Enables flatpak";
  };

  config = lib.mkIf config.flatpak.enable {
    # Flatpak
    services.flatpak.enable = true;
  };
}

