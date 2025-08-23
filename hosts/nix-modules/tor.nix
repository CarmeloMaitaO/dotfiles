{ config, lib, pkgs, ... }:
{
  options = {
    torcontainer.enable = lib.mkEnableOption "Enables the Tor container";
  };

  config = lib.mkIf config.torcontainer.enable {
    containers.tor-container = {
      autoStart = false;
      config = { ... }: {

        system.stateVersion = "24.11"; # If you don't add a state version, nix will complain at every rebuild

        # Exposing the necessary ports in order to interact with i2p from outside the container
        networking.firewall.allowedTCPPorts = [
          7656 # default sam port
          7070 # default web interface port
          4447 # default socks proxy port
          4444 # default http proxy port
        ];

        services.tor = {
          enable = true;
          openFirewall = true;
          client = {
            enable = true;
            dns.enable = true;
          };
        };
      };
    };
  };
}

