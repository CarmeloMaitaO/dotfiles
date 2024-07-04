{
  description = "Nixos config flake";

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
          ./modules/nixos/packages-documents.nix
          ./modules/nixos/packages-graphics.nix
          ./modules/nixos/packages-metadata.nix
          ./modules/nixos/printing.nix
          ./modules/nixos/packages-webclients.nix
          ./modules/nixos/packages-browsers.nix
          ./modules/nixos/packages-communications.nix
          ./modules/nixos/packages-cryptography.nix
          ./modules/nixos/packages-ebooks.nix
          ./modules/nixos/packages-games.nix
          ./modules/nixos/packages-it-tools.nix
          ./modules/nixos/packages-monero.nix
          ./modules/nixos/packages-notes.nix
          ./modules/nixos/packages-plotting.nix
          ./modules/nixos/packages-privacy-utilities.nix
          ./modules/nixos/packages-video-editing.nix
          ./modules/nixos/packages-git.nix
          ./modules/nixos/packages-compression.nix
          ./modules/nixos/packages-develop-environment.nix
          ./modules/nixos/packages-download-managers.nix
          ./modules/nixos/packages-multimedia.nix
          ./modules/nixos/packages-software-store.nix
          ./modules/nixos/packages-vaults.nix
          ./modules/nixos/packages-pomodoro.nix
          ./modules/nixos/packages-finances.nix
          ./modules/nixos/packages-languages.nix
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
