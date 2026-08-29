{self, inputs, ...}: {
  flake.nixosModules.nixconf = {pkgs, lib, ...}: {
    environment.systemPackages = with pkgs; [
      nix-index
    ];
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
      };
    };
  };
}
