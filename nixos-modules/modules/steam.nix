{ config, lib, pkgs, ... }:
{
  options = {
    steam.enable = lib.mkEnableOption "Enables Steam";
  };

  config = lib.mkIf config.steam.enable {
    # Steam
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
    programs.gamemode = {
      enable = true;
    };
    hardware.steam-hardware.enable = true;
    hardware.xone.enable = true;
    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = 
        "/home/chiguire/.steam/root/compatibilitytools.d";
    };
  };
}

