{ config, lib, pkgs, ... }:

let
  cfg = config.networking;
in

with pkgs.lib; {
  options = {
    networking.enable = mkEnableOption "Enables Networkmanager";
  };

  config = mkIf cfg.enable {
    # Networking
    networking.networkmanager = {
      enable = true;
    };
  };
}

