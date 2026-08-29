{self, inputs, ...}: {
  flake.nixosModules.gaming = {pkgs, lib, ...}: {
    environment.systemPackages = with pkgs; [
      prismlauncher
      shattered-pixel-dungeon
    ];
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
