{ config, lib, pkgs, ... }:
{
  options = {
    net.enable = lib.mkEnableOption "Enables Networkmanager";
  };

  config = lib.mkIf config.net.enable {
    # Networking
    networking = {
      networkmanager = {
        enable = true;
        dns = "none";
      };
      nameservers = [
        "1.1.1.1"
        "1.0.0.1"
      ];
    };

    services = {
      dnscrypt-proxy2 = {
        enable = true;
        settings = {
          ipv6_servers = true;
          require_dnssec = true;
          sources.public-resolvers = {
            urls = [
              "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
              "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
            ];
            cache_file = "/var/cache/dnscrypt-proxy/public-resolvers.md";
            minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
          };
          forwarding_rules = "/etc/nixos/services/networking/forwarding-rules.txt";
        };
      };
    };

    environment = {
      systemPackages = with pkgs; [
        networkmanagerapplet
      ];
      etc = {
        "nixos/services/networking/fowarding-rules.txt" = {
          text = ''
            lan            127.0.0.1,$DHCP
            home           127.0.0.1,$DHCP
            localdomain    127.0.0.1,$DHCP
            local          127.0.0.1,$DHCP
            internal       127.0.0.1,$DHCP           
            onion          127.0.0.1:9053
            i2p            127.0.0.1:4444
          '';
          mode = "0600";
        };
      };
    };
  };
}

