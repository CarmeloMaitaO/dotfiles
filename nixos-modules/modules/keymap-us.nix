{ config, lib, pkgs, ... }:

let
  cfg = config.keymapUS;
in

with pkgs.lib; {
  options = {
    keymapUS.enable = mkEnableOption "Sets the keyboard distribution to US-intl";
  };

  config = mkIf cfg.enable {
    # Keymap US
    services.xserver = {
      xkb = {
        layout = "us";
	variant = "intl";
      };
    };
    console = {
      keymap = "us-acentos";
    };
  };
}
