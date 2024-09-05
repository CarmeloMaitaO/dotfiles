{ config, lib, pkgs, ... }:

let
  cfg = config.budgie;
in

with pkgs.lib; {
  options = {
    budgie.enable = mkEnableOption "Enables the Budgie DE";
  };

  config = mkIf cfg.enable {
    # Budgie
    services.xserver.desktopManager = {
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
	mate.nemo
	mate.pluma
	mate.atril
	mate.engrampa
	mate.mate-calc
	mate.mate-system-monitor
      ];
    };

  };
}

