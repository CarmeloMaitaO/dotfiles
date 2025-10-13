{
  description = ''
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
  }; # inputs
  
  outputs = inputs @ { flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; }
    {
      ; # your code here
    }; # flake-parts.lib.mkFlake { inherit inputs; }
}
