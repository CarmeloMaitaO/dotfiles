# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, modulesPath, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  environment.systemPackages = [
    pkgs.git
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Capybara";

  localeVE.enable = true;
  keymapUS.enable = true;
  networking.enable = true;
  nixconf.enable = true;
  fish.enable = true;
  steam.enable = true;
  flatpak.enable = true;
  audio.enable = true;
  graphics.enable = true;
  virtualisation.enable = true;
  printing.enable = true;
  budgie.enable = true;
  lightdm.enable = true;
  disableRPFilter.enable = true;

  stylix = {
    enable = true;
    image = inputs.bg-system;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    fonts = {
      serif = {
        package = pkgs.nerdfonts;
        name = "0xProto Nerd Font Regular";
      };

      sansSerif = {
        package = pkgs.nerdfonts;
        name = "Go Mono Nerd Font Regular";
      };

      monospace = {
        package = pkgs.nerdfonts;
        name = "0xProto Nerd Font Mono Regular";
      };

      emoji = {
        package = pkgs.nerdfonts;
        name = "Noto Color Emoji";
      };
    };
  };

  system.stateVersion = "23.11";
}
