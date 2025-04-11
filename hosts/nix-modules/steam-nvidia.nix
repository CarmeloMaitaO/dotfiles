{ config, lib, pkgs, ... }:
with pkgs; let
  patchDesktop = pkg: appName: from: to: lib.hiPrio (
    pkgs.runCommand "$patched-desktop-entry-for-${appName}" {} ''
    ${coreutils}/bin/mkdir -p $out/share/applications
    ${gnused}/bin/sed 's#${from}#${to}#g' < ${pkg}/share/applications/${appName}.desktop > $out/share/applications/${appName}.desktop
  '');
  GPUOffloadApp = pkg: desktopName: patchDesktop pkg desktopName "^Exec=" "Exec=nvidia-offload ";
in
{
  options = {
    steam-nvidia.enable = lib.mkEnableOption "Enables Steam";
  };

  config = lib.mkIf config.steam-nvidia.enable {
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
        "/home/pi/.steam/root/compatibilitytools.d";
    };
    environment.systemPackages = with pkgs; [
      (GPUOffloadApp steam "steam")
    ];
  };
}

