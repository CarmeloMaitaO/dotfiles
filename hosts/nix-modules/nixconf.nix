{ config, lib, pkgs, ... }:
{
  options = {
    nixconf.enable = lib.mkEnableOption "Enables flakes, adds substituters, and allow unfree and broken packages in nix";
  };

  config = lib.mkIf config.nixconf.enable {
    # Nix
    nixpkgs.config = {
      allowUnfree = true;
      allowBroken = true;
      allowInsecurePredicate = pkg: true;
    };
    nix = {
      optimise.automatic = true;
      settings = {
        auto-optimise-store = true;
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        substituters = [
          "https://nix-community.cachix.org"
          "https://cache.nixos.org/"
        ];
        trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
      };
    };
  };
}

