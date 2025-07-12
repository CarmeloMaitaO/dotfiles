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
      desktopManager.xterm.enable = false; # Disables Xterm
    }; # services.xserver
    programs.dconf = {
      enable = true;
    };
    environment.systemPackages = with pkgs; [
      pkgs.gnome-remote-desktop
    ];
    environment.gnome = {
      excludePackages = with pkgs; [
        gnome-tour
        gnome-console
        xterm
        totem
        epiphany
      ];
    };
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    environment.variables = {
      GSK_RENDERER = "ngl";
    };
  };
}
