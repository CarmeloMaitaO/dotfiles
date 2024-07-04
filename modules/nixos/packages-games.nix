{ config, lib, pkgs, ... }:
{
  config = {
    environment.systemPackages = with pkgs; [
      prismlauncher
      cool-retro-term
      nethack
      shattered-pixel-dungeon
    ];
  };
}
