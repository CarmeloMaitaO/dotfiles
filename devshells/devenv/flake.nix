{
  description = "Nim-centric development environment";

  inputs = {
    # Latest commit in the branch nixos-25.11
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    # Flake-parts
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ { flake-parts, ... }:
  flake-parts.lib.mkFlake { inherit inputs; }
  {
    systems = [
      "x86_64-linux"
      "aarch64-linux"
    ]; # systems

    perSystem = { pkgs, ... }: {
      # packages.paquete = pkgs.paquete;
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          # Nim
          nim
          nimble
          nim-atlas
          nph
          # Compilers and bundlers
          zig
          bun
          # File/Application formats and their tooling
          sqlite
          # Deployment
          ops # Nanos unikernel
        ]; # buildInputs
        nativeBuildInputs = with pkgs; [
          pkg-config
        ]; # nativeBuildInputs
        shellHook = ''
          export PATH=$PATH:$HOME/.nimble/bin
          alias 'node'='bun'
        ''; # shellHook
      }; # devShells.default
    }; # perSystem

    flake = {}; # flake
  }; # flake-parts.lib.mkFlake
}
