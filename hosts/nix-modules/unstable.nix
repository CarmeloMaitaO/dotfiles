{ config, lib, pkgs, inputs, pkgsUnstable, ... }:
{
  options = {
    nixpkgsUnstable = {
      enable = lib.mkEnableOption "Enables unstable packages";
      packages = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ];
        example = lib.literalExpression "[ \"euphonica\" \"freetube\" ]";
        description = "Allows to install unstable packages in environment.systemPackages";
      }; # packages
    }; # nixpkgsUnstable
  };

  config = lib.mkIf config.nixpkgsUnstable.enable {
    _module.args.pkgsUnstable = import inputs.nixpkgs-unstable {
      inherit (pkgs.stdenv.hostPlatform) system;
      inherit (config.nixpkgs) config;
    };
    # use the following syntax:
    # environment.systemPackages =  [
    #   pkgsUnstable.package
    # ]
    environment.systemPackages = map (
      x: pkgsUnstable.${x}
    ) config.nixpkgsUnstable.packages;
  };
}

