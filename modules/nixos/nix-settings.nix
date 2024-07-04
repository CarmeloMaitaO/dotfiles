{ config, lib, pkgs, ... }:
{

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    allowInsecurePredicate = pkg: true;
  };
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  
  nix.optimise.automatic = true;
  nix.settings.auto-optimise-store = true;
}
