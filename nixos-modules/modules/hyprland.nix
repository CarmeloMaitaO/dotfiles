{ config, lib, pkgs, ... }:
{
  options = {
    hyprland.enable = lib.mkEnableOption "Enables the Hyprland WM";
  };

  config = lib.mkIf config.hyprland.enable {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
    #programs.hyprlock.enable = true;
    #services.hypridle.enable = true;
    environment.systemPackages = with pkgs; [
      hyprpaper
      hyprsunset
      mako
      wofi
      grim
      slurp
      xorg.xev
    ];
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
