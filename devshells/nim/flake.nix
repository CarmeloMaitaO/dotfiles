{
  description = "Nim development environment";

  inputs = {
    # Latest commit in the branch nixos-24.11
    nixpkgs.url = "github:nixos/nixpkgs/9b5ac7ad45298d58640540d0323ca217f32a6762";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
    forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (
      system: f {
        pkgs = import nixpkgs { inherit system; };
      }
    );
  in {
    devShells = forEachSupportedSystem (
      { pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            nim
            nimble
            nph
            zig
            nushell
            nodejs_23
            sqlite
            electron-bin
            android-tools
          ];
          shellHook = ''
            nu
          '';
        };
      }
    );
  };
}
