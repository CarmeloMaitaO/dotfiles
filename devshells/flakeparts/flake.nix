{
  description = "Flake-parts template";

  inputs = {
    # Latest commit in the branch nixos-25.05
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    # Flake-parts
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ { flake-parts, ... }:
  flake-parts.lib.mkFlake { inherit inputs; }
  {
    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ]; # systems

    perSystem = { pkgs, ... }: {
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          #;
        ]; # buildInputs
        nativeBuildInputs = with pkgs; [
          pkg-config
        ]; # nativeBuildInputs
        shellHook = ''
          #;
        ''; # shellHook
      }; # devShells.default
    }; # perSystem

    flake = {}; # flake
  }; # flake-parts.lib.mkFlake
}
