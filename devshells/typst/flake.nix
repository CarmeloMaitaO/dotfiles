{
  description = "Typst development environment";

  inputs = {
    # Latest commit in the branch nixos-25.05
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
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
            typst
            typstPackages.academicv
            typstPackages.swe-cv
            typstPackages.rivet
            typstPackages.codly
            typstPackages.codly
            typstPackages.codly-languages
            typstPackages.km
            typstPackages.wavy
          ];
          shellHook = ''
          '';
        };
      }
    );
  };
}
