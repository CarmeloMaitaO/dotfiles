{ config, lib, pkgs, ... }:
{
  config = {
    services.xserver.desktopManager.budgie.enable = true;

    programs.dconf.enable = true;
    
    environment.budgie.excludePackages = with pkgs; [
      vlc
      mate.mate-terminal
      xterm
    ];
    environment.systemPackages = with pkgs; [
      kitty
      ydotool
    ];
  };
}
