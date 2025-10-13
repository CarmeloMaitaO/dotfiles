{
  description = ''
  A centralized repository of my dotfiles, automation scripts, and hobby
  projects (browser startpages, gaming automation, ...) for Linux and Windows
  '';
  nixConfig = {

    extra-substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
    ]; # extra-substituters

    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ]; # extra-trusted-public-keys

  }; # nixConfig

  inputs = {

    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-25.05";
    }; # nixpkgs

    nixpkgs-unstable = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    }; # nipkgs-unstable

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    }; # flake-parts

  }; # inputs

  outputs = inputs @ { flake-parts, ... }:
  flake-parts.lib.mkFlake { inherit inputs; }
  {
    systems = [
      "x86_64-linux"
    ]; # systems

    perSystem = { pkgs, ... }: {
      #packages.miPaquete = pkgs.etc;
      # devShells.default = pkgs.mkShell {
      #   packages = [ self'.packages.miPaquete ];
      # };
    }; # perSystem
    
    flake = {
      nixosConfigurations = {
        nixos-home = inputs.nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          system = "x86_64-linux";
          modules = [
            ./hosts/nixos-home/configuration.nix
            ./hosts/nix-modules/modules-package.nix
            ./hosts/nix-modules/users/chiguire.nix
          ];
        }; # nixos-home
      }; # nixosConfigurations
    }; # flake

    # templates = rec {
    #   devenv = {
    #     path = ./devshells/devenv;
    #     description = ''
    #       Nim-centric development environment with additional support for:
          
    #       - C
    #       - C++
    #       - JS
    #       - Zig
          
    #       Included tools:

    #       - Bun
    #       - SQLite
    #       - QT6
    #       - LLDB
    #       - Cmake
    #       - CPM
    #     '';
    #   }; # devenv
    # }; # templates
  }; # flake-parts.lib.mkflake

}
