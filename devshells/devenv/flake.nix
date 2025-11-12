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
      "x86_64-darwin"
      "aarch64-darwin"
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
          libclang
          lldb
          emscripten
          # Databases
          sqlite
          # Kernels, runtimes and tools
          cmake
          bun # JS runtime/bundler/etc...
          msitools # Make MSIs
          osslsigncode # Sign MSIs
          androidenv.androidPkgs.ndk-bundle # Android NDK tools
          # Raylib
          xorg.libX11
          xorg.libX11.dev
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXrandr
        ]; # buildInputs
        nativeBuildInputs = with pkgs; [
          pkg-config
        ]; # nativeBuildInputs
        shellHook = ''
          export PATH=$PATH:$HOME/.nimble/bin
          alias 'node'='bun'
        ''; # shellHook
        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [pkgs.alsa-lib];
      }; # devShells.default
    }; # perSystem

    flake = {}; # flake
  }; # flake-parts.lib.mkFlake
}
