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
      url = "github:nixos/nixpkgs/nixos-25.05";
    }; # nixpkgs

    nixpkgs-unstable = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    }; # nipkgs-unstable

    fjordlauncher = {
      url = "github:unmojang/FjordLauncher";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
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
      url = "github:danth/stylix/release-25.05";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      }; # inputs
    }; # stylix

    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    }; # nur

    bg-pixelcity = {
      url = "https://gruvbox-wallpapers.pages.dev/wallpapers/pixelart/wall_secondary.png";
      flake = false;
    }; # wallpaper

    bg-mountain = {
      url = "https://gruvbox-wallpapers.pages.dev/wallpapers/mix/mountain.jpg";
      flake = false;
    }; # wallpaper

    bg-pi = {
      url = "https://images.alphacoders.com/709/709259.jpg";
      flake = false;
    };

    tmtheme-gruvbox = {
      url = "https://raw.githubusercontent.com/subnut/gruvbox-tmTheme/64c47250e54298b91e2cf8d401320009aba9f991/gruvbox-dark.tmTheme";
      flake = false;
    };

  }; # inputs

  outputs = inputs@{ self, nixpkgs, nix-on-droid, fjordlauncher, ... }: {
    nixosConfigurations = {

      nixos-home = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [
          ./hosts/nixos-home/configuration.nix
          ./hosts/nix-modules/modules-package.nix
          ./hosts/nix-modules/users/chiguire.nix
          inputs.home-manager.nixosModules.home-manager {
            
            home-manager = {
              extraSpecialArgs = { inherit inputs; };
              useGlobalPkgs = true;
              backupFileExtension = "backup";
              useUserPackages = true;
              users.chiguire = import ./hosts/nix-modules/users/chiguire-hm.nix;
            }; # home-manager
          } # inputs.home-manager.nixosModule.home-manager
          inputs.stylix.nixosModules.stylix
        ];
      }; # nixos-home

      nixos-work = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [
          ./hosts/nixos-work/configuration.nix
          ./hosts/nix-modules/modules-package.nix
          ./hosts/nix-modules/users/chiguire.nix
          inputs.home-manager.nixosModules.home-manager {
            home-manager = {
              extraSpecialArgs = { inherit inputs; };
              useGlobalPkgs = true;
              backupFileExtension = "backup";
              useUserPackages = true;
              users.chiguire = import ./hosts/nix-modules/users/chiguire-hm.nix;
            }; # home-manager
          } # inputs.home-manager.nixosModule.home-manager
          inputs.stylix.nixosModules.stylix
        ];
      }; # nixos-work

      nixos-pi = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [
          ./hosts/nixos-pi/configuration.nix
          ./hosts/nix-modules/modules-package.nix
          ./hosts/nix-modules/users/pi.nix
          ./hosts/nix-modules/users/chiguire.nix
          inputs.home-manager.nixosModules.home-manager {
            home-manager = {
              extraSpecialArgs = { inherit inputs; };
              useGlobalPkgs = true;
              backupFileExtension = "backup";
              useUserPackages = true;
              users.pi = import ./hosts/nix-modules/users/pi-hm.nix;
              users.chiguire = import ./hosts/nix-modules/users/chiguire-hm.nix;
            }; # home-manager
          } # inputs.home-manager.nixosModule.home-manager
          inputs.stylix.nixosModules.stylix
          (
            { pkgs, ... }:
            {
              nixpkgs.overlays = [ fjordlauncher.overlays.default ];

              environment.systemPackages = [ pkgs.fjordlauncher ];
            }
          )
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
