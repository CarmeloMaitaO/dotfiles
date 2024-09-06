{ config, lib, pkgs, ... }:
{
  options = {
    disableRPFilter.enable = lib.mkEnableOption "disables RPFilter";
  };
  config = lib.mkIf config.disableRPFilter.enable {
    networking.firewall.checkReversePath = false;
  };
}
