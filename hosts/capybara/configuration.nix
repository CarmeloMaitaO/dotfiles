# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, modulesPath, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Daily";

  essentials = {
    localeVE = true;
    keymapUS = true;
    networking = true;
    nix = true;
    fish = true;
  };
  programs = {
    steam = true;
  };
  desktopEssentials = {
    flatpak = true;
    audio = true;
    graphics = true;
    virtualisation = true;
    printing = true;
  };
  desktopEnvironment = {
    budgie = true;
    lightDM = true;
  };
  stylix = {
    enable = true;
    image = inputs.bg-gaming;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

  system.stateVersion = "23.11";
}