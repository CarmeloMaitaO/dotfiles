{ config, lib, pkgs, ... }:
with pkgs; {
  config = {
    imports = [
      ./modules/steam.nix
    ];
  };
}
