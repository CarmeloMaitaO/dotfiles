{ config, lib, pkgs, ... }:
{
  options = {
    greetd.enable = lib.mkEnableOption "Enables the Greetd DM";
  };

  config = lib.mkIf config.greetd.enable {
    services.greetd = {
      enable = true;
      vt = 1;
    };
    programs.regreet = {
      enable = true;
    };
  };
}
