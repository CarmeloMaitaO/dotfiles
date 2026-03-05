{
  description = "Nim-centric development environment";

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
          # LLVM
          clang
          emscripten
          lldb
          libclang
        ]; # buildInputs
        shellHook = ''
          export PATH=$PATH:$HOME/.nimble/bin
        ''; # shellHook
      }; # devShells.default
    }; # perSystem

    flake = {}; # flake
  }; # flake-parts.lib.mkFlake
}
