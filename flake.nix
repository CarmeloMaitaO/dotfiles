{
  description = ''
  A centralized repository of my dotfiles, automation scripts, and hobby
  projects (browser startpages, gaming automation, ...) for Linux and Windows
  '';

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

      templates = {
        devenv = {
          path = ./devshells/devenv;
          description = ''
            Nim-centric development environment with additional support for:

            - JS
            - Zig
            - C
            - C++
            - Rust
          '';
        }; # devenv
        flakeparts = {
          path = ./devshells/flakeparts;
          description = "Flake-parts template";
        }; # flakeparts
      }; # templates
    }; # flake

  }; # flake-parts.lib.mkflake

}
