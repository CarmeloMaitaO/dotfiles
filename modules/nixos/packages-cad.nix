{ config, lib, pkgs, ... }:
{
  config = {
    environment.systemPackages = with pkgs; [
      openscad
      freecad
      brlcad
    ];
  };
}
