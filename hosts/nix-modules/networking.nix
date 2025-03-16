{ config, lib, pkgs, ... }:
{
  options = {
    networking.enable = lib.mkEnableOption "Enables Networkmanager";
  };

  config = lib.mkIf config.networking.enable {
    # Networking
    networking.networkmanager = {
      enable = true;
    };
    environment.systemPackages = with pkgs; [
      networkmanagerapplet
    ];
  };
}

