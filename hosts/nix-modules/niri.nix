{ config, lib, pkgs, ... }:
{
  options = {
    niriWM.enable = lib.mkEnableOption "Enables the Niri WM";
  };

  config = lib.mkIf config.niriWM.enable {
    services = {
      displayManager.gdm = {
        enable = true;
        wayland = true;
      }; # displayManager.gdm
    }; # services.xserver
    programs.dconf = {
      enable = true;
    };
    programs.niri = {
      enable = true;
      useNautilus = true;
    };
    programs.xwayland = {
      enable = true;
    };
    environment.systemPackages = with pkgs; [
      xwayland-satellite
      dconf-editor
      nautilus
      quickshell
      fuzzel
    ];
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      PROTON_ENABLE_WAYLAND = "1";
      # LIBGL_ALWAYS_SOFTWARE = "true";
    };
    # environment.variables = {
    #   GSK_RENDERER = "ngl";
    # };
  };
}
