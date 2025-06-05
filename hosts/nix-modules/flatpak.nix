{ config, lib, pkgs, ... }:
{
  options = {
    flatpak.enable = lib.mkEnableOption "Enables flatpak";
  };

  config = lib.mkIf config.flatpak.enable {
    # Flatpak
    services.flatpak.enable = true;
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-xapp
        xdg-desktop-portal-gnome
        xdg-desktop-portal-hyprland
      ];
    };
  };
}

