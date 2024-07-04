{ config, lib, pkgs, ... }:
{
  config = {
    environment.systemPackages = with pkgs; [
      gnome.gnome-software
    ];
  };
}
