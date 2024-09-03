{ config, lib, pkgs, ... }:

let
  cfg = config.programs;
in

with pkgs.lib; {
  options = {
    programs = {
      steam = mkEnableOption "Enables Steam";
    };
  };

  config = {
    # Steam
    programs.steam = mkIf cfg.steam {
      enable = true;
      gamescopeSession.enable = true;
    };
    programs.gamemode = mkIf cfg.steam {
      enable = true;
    };
    environment.sessionVariables = mkIf cfg.steam {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = 
        "/home/chiguire/.steam/root/compatibilitytools.d";
    };

  };
}
