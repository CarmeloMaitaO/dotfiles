{ config, lib, pkgs, ... }:
{
  config = {
    environment.systemPackages = with pkgs; [
      tuba
      vesktop
      whatsapp-for-linux
      telegram-desktop
      gnome.geary
    ];
  };
}
