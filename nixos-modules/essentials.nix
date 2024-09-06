{ config, lib, pkgs, ... }:
{
  imports = [
    ./modules/locale-ve.nix
    ./modules/keymap-us.nix
    ./modules/networking.nix
    ./modules/nixconf.nix
    ./modules/fish.nix
    ./modules/disable-rpfilter.nix
  ];
}
