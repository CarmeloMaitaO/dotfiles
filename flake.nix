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
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

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

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    bg-system = {
      url = "https://gruvbox-wallpapers.pages.dev/wallpapers/minimalistic/gruvbox-nix.png";
      flake = false;
    };

    bg-chiguire = {
      url = "https://gruvbox-wallpapers.pages.dev/wallpapers/pixelart/wall_secondary.png";
      flake = false;
    };

  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {

      capybara = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/capybara/configuration.nix
          ./hm-modules/user-chiguire.nix
	  ./nixos-modules/essentials.nix
	  ./nixos-modules/desktop-essentials.nix
	  ./nixos-modules/programs-bundle.nix
	  inputs.stylix.nixosModules.stylix
	  inputs.home-manager.nixosModules.home-manager
	  {
	    home-manager.extraSpecialArgs = { inherit inputs; };
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.backupFileExtension = "old";
            home-manager.sharedModules = [ {
              gtk.iconTheme = {
                package = nixpkgs.legacyPackages.x86_64-linux.pkgs.gruvbox-plus-icons;
                name = "Gruvbox-Plus-Dark";
              };
            } ];
	    home-manager.users.chiguire = import ./hm-modules/user-chiguire-hm.nix;
	  }
        ];
      };

    };
  };
}
