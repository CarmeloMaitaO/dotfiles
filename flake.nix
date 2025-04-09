{
  description = ''
  A centralized repository of my dotfiles, automation scripts, and hobby
  projects (browser startpages, gaming automation, ...) for Linux, Windows, and
  Android (AArch64)
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
      url = "github:nixos/nixpkgs/nixos-24.11";
    }; # nixpkgs

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    }; # home-manager

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      }; # inputs
    }; # nix-on-droid

    stylix = {
      url = "github:danth/stylix/release-24.11";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      }; # inputs
    }; # stylix

    flatpaks = {
      url = "github:GermanBread/declarative-flatpak/stable-v3";
    };

    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    }; # nur

    bg-home = {
      url = "https://gruvbox-wallpapers.pages.dev/wallpapers/pixelart/wall_secondary.png";
      flake = false;
    }; # wallpaper

    bg-work = {
      url = "https://gruvbox-wallpapers.pages.dev/wallpapers/mix/mountain.jpg";
      flake = false;
    }; # wallpaper

    bg-pi = {
      url = "https://images.alphacoders.com/709/709259.jpg";
      flake = false;
    };

  }; # inputs

  outputs = inputs@{ self, nixpkgs, nix-on-droid, ... }: {
    nixosConfigurations = {
      nixos-work = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [
          ./hosts/nixos-work/configuration.nix
          ./hosts/nix-modules/modules-package.nix
          ./hosts/nix-modules/users/tecnico.nix
          inputs.home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              backupFileExtension = "backup";
              useUserPackages = true;
              users.tecnico = import ./hosts/nix-modules/users/tecnico-hm.nix;
            }; # home-manager
          } # inputs.home-manager.nixosModule.home-manager
          inputs.stylix.nixosModules.stylix
        ];
      }; # nixos-work

      nixos-home = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [
          ./hosts/nixos-home/configuration.nix
          ./hosts/nix-modules/modules-package.nix
          ./hosts/nix-modules/users/chiguire.nix
          inputs.home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              backupFileExtension = "backup";
              useUserPackages = true;
              users.chiguire = import ./hosts/nix-modules/users/chiguire-hm.nix;
            }; # home-manager
          } # inputs.home-manager.nixosModule.home-manager
          inputs.stylix.nixosModules.stylix
          inputs.flatpaks.nixosModules.declarative-flatpak
        ];
      }; # nixos-home

      nixos-pi = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [
          ./hosts/nixos-pi/configuration.nix
          ./hosts/nix-modules/modules-package.nix
          ./hosts/nix-modules/users/pi.nix
          inputs.home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              backupFileExtension = "backup";
              useUserPackages = true;
              users.chiguire = import ./hosts/nix-modules/users/pi-hm.nix;
            }; # home-manager
          } # inputs.home-manager.nixosModule.home-manager
          inputs.stylix.nixosModules.stylix
          inputs.flatpaks.nixosModules.declarative-flatpak
        ];
      }; # nixos-pi
    }; # nixosConfigurations

    nixOnDroidConfigurations = {
      default = nix-on-droid.lib.nixOnDroidConfiguration {
        pkgs = import nixpkgs { system = "aarch64-linux"; };
        modules = [
          ./hosts/nix-on-droid/nix-on-droid.nix
        ];
      }; # default
    }; # nixOnDroidConfigurations

    templates = rec {
      nim = {
        path = ./devshells/nim;
        description = "Nim development environment with Zig and QT libs";
      }; # nim
      "c++" = {
        path = ./devshells/c++;
        description = "C++ development environment with Zig and QT libs";
      }; # c++
      typst = {
        path = ./devshells/typst;
        description = "Typst development environment";
      }; # typst
      lua = {
        path = ./devshells/lua;
        description = "Lua development environment";
      }; # lua
    };
  }; # outputs

}
