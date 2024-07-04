{ config, lib, pkgs, ... }:
{
  config = {
    environment.systemPackages = with pkgs; [
      gnome-obfuscate
      metadata-cleaner
    ];
  };
}
