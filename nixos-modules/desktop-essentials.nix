{ config, lib, pkgs, ... }:
{
  imports = [
    ./modules/flatpak.nix
    ./modules/audio.nix
    ./modules/graphics.nix
    ./modules/virtualisation.nix
    ./modules/printing.nix
    ./modules/budgie.nix
    ./modules/lightdm.nix
  ];
}
