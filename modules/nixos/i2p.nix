{ config, pkgs, ... }:
{
  containers.i2p = {
    autoStart = true;
    privateNetwork = true;
    hostAddress = "192.168.100.10";
    localAddress = "192.168.100.11";

    config = { config, pkgs, ...}: {
      system.stateVersion = "23.05";
      environment.systemPackages = with pkgs; [
        nmapsi4
      ];
      environment.etc."resolv.conf".text = ''
        nameserver 1.1.1.1
        nameserver 1.0.0.1
      '';
      networking.firewall.enable = false;
      services.i2pd = {
        enable = true;
	enableIPv4 = true;
	enableIPv6 = false;
	bandwidth = 500;
        port = 9111;
	exploratory = {
	  inbound = {
	    length = 4;
	    quantity = 4;
	  };
	  outbound = {
	    length = 4;
	    quantity = 4;
	  };
	};
	proto.http = {
	  enable = true;
	  auth = true;
	  user = "i2pd";
	  pass = "i2pd";
	  port = 7070;
	  address = "192.168.100.11";
	};
	proto.socksProxy = {
	  enable = true;
	  address = "192.168.100.11";
	  port = 4447;
	  inbound = {
	    length = 4;
	    quantity = 4;
	  };
	  outbound = {
	    length = 4;
	    quantity = 4;
	  };
	  outproxyEnable = true;
	  outproxy = "outproxy.bandura.i2p";
	};
	addressbook = {
	  defaulturl = "http://joajgazyztfssty4w2on5oaqksz6tqoxbduy553y34mf4byv6gpq.b32.i2p/export/alive-hosts.txt";
	  subscriptions = [
	    "http://inr.i2p/export/alive-hosts.txt"
            "http://i2p-projekt.i2p/hosts.txt"
            "http://stats.i2p/cgi-bin/newhosts.txt"
	    "http://shx5vqsw7usdaunyzr2qmes2fq37oumybpudrd4jjj4e4vk4uusa.b32.i2p/export/hosts.txt"
	  ];
	};
      };
    };
  };
}

