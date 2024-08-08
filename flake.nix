{
  description = "Nixos config flake";
  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
    ];

    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    bg-gaming = {
      url = "https://gruvbox-wallpapers.pages.dev/wallpapers/pixelart/secluded-grove-pixel.png";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      daily = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/daily/configuration.nix
          ./modules/home-manager/user-chiguire.nix
          ./modules/nixos/dm-lightdm.nix
          ./modules/nixos/de-budgie.nix
          ./modules/nixos/flatpak-conf.nix
          ./modules/nixos/locale-ve.nix
          ./modules/nixos/keymap-us.nix
          ./modules/nixos/networking.nix
          ./modules/nixos/nix-settings.nix
          ./modules/nixos/sound.nix
          ./modules/nixos/steam-conf.nix
          ./modules/nixos/video-conf.nix
          ./modules/nixos/qemu-conf.nix
          ./modules/nixos/shell-zsh.nix
	  ./modules/nixos/waydroid.nix
          ./modules/nixos/printing.nix
          /home/chiguire/.wireguard/kerodon/wireguard-kerodon-0.nix
	  inputs.stylix.nixosModules.stylix
        ];
      };
      tools = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/gaming/configuration.nix
	        ./modules/home-manager/user-chiguire.nix
	        ./modules/nixos/boot.nix
	        ./modules/nixos/desktop-environment.nix
	        ./modules/nixos/essential-packages.nix
	        ./modules/nixos/flatpak-conf.nix
	        ./modules/nixos/locale.nix
	        ./modules/nixos/networking.nix
	        ./modules/nixos/nix-settings.nix
	        ./modules/nixos/sound.nix
	        ./modules/nixos/steam-conf.nix
          ./modules/nixos/variables.nix
          ./modules/nixos/video-conf.nix
          ./modules/nixos/qemu-conf.nix
          #inputs.home-manager.nixosModules.default
          #inputs.stylix.homeManagerModules.stylix
          #inputs.stylix.nixosModules.stylix
          #inputs.nixvim.nixosModules.nixvim
        ];
      };
    };
  };
}
