{ config, lib, pkgs, ... }:

let
  cfg = config.steam;
in

with pkgs.lib; {
  options = {
    steam.enable = mkEnableOption "Enables Steam";
  };

  config = mkIf cfg.enable {
    # Steam
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    programs.gamemode = {
      enable = true;
    };
    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = 
        "/home/chiguire/.steam/root/compatibilitytools.d";
    };
  };
}

