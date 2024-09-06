{ config, lib, pkgs, ... }:
{
  options = {
    budgie.enable = lib.mkEnableOption "Enables the Budgie DE";
  };

  config = lib.mkIf config.budgie.enable {
    # Budgie
    services.xserver.desktopManager.budgie = {
      enable = true;
    };
    programs.dconf = {
      enable = true;
    };
    environment.budgie = {
      excludePackages = with pkgs; [
        vlc
	xterm
	mate.mate-terminal
	nemo
	mate.pluma
	mate.atril
	mate.engrampa
	mate.mate-calc
	mate.mate-system-monitor
      ];
    };

  };
}

