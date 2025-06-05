{ config, lib, pkgs, ... }:
{
  options = {
    keymapUS.enable = lib.mkEnableOption "Sets the keyboard distribution to US-intl";
  };

  config = lib.mkIf config.keymapUS.enable {
    # Keymap US
    services.xserver = {
      xkb = {
        layout = "us";
	variant = "intl";
      };
    };
    console = {
      keyMap = "us-acentos";
    };
  };
}
