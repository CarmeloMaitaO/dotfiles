{ config, lib, pkgs, ... }:
with pkgs; {
  config = {
    imports = [
      ./modules/locale-ve.nix
      ./modules/keymap-us.nix
      ./modules/networking.nix
      ./modules/nixconf.nix
      ./modules/fish.nix
    ];
  };
}
