{ config, lib, pkgs, ... }:
{
  config = {
    environment.systemPackages = with pkgs; [
      imagemagickBig
      conjure
      krita
      inkscape
      switcheroo
    ];
  };
}
