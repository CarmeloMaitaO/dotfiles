{ config, lib, pkgs, ... }:
{
  options = {
    gnome.enable = lib.mkEnableOption "Enables the Gnome DE";
  };

  config = lib.mkIf config.gnome.enable {
    # Gnome
    services.xserver.desktopManager.gnome = {
      enable = true;
    };
    programs.dconf = {
      enable = true;
    };
    environment.gnome = {
      excludePackages = with pkgs; [
        gnome-tour
        epiphany
        gnome-console
        xterm
      ];
    };
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
