{ config, lib, pkgs, ... }:
{
  imports = [
    ./flatpak.nix
    ./audio.nix
    ./graphics.nix
    ./virtualisation.nix
    ./printing.nix
    ./gnome.nix
    ./locale-ve.nix
    ./keymap-us.nix
    ./networking.nix
    ./bluetooth.nix
    ./nixconf.nix
    ./nushell.nix
    ./starship.nix
    ./steam.nix
    ./steam-nvidia.nix
    ./unstable.nix
    ./i2p.nix
    ./tor.nix
  ];
}
