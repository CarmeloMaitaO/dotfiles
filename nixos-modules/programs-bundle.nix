{ config, lib, pkgs, ... }:
{
  config = {
    imports = [
      ./modules/steam.nix
    ];
  };
}
