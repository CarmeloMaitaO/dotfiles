{ config, lib, pkgs, ... }:
{
  config = {
    environment.systemPackages = with pkgs; [
      freetube
      newsflash
      wike
    ];
  };
}
