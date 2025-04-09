{ config, lib, pkgs, ... }:
{
  options = {
    gnome.enable = lib.mkEnableOption "Enables the Gnome DE";
  };

  config = lib.mkIf config.gnome.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      }; # displayManager.gdm
      desktopManager.gnome = {
        enable = true;
      }; # desktopManager.gnome
    }; # services.xserver
    programs.dconf = {
      enable = true;
    };
    environment.gnome = {
      excludePackages = with pkgs; [
        gnome-tour
        epiphany
        gnome-console
        xterm
        totem
      ];
    };
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
