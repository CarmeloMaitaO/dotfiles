{ config, lib, pkgs, ... }:

let
  cfg = config.localeVE;
in

with pkgs.lib; {
  options = {
    localeVE.enable = mkEnableOption "Sets the locales for VE";
  };

  config = mkIf cfg.enable {
    # Locale VE
    time = {
      timeZone = "America/Caracas";
    };
    i18n = {
      defaultLocale = "en_US.UTF-8";
    };
    extraLocaleSettings = {
      LC_ADDRESS = "es_VE.UTF-8";
      LC_IDENTIFICATION = "es_VE.UTF-8";
      LC_MEASUREMENT = "es_VE.UTF-8";
      LC_MONETARY = "es_VE.UTF-8";
      LC_NAME = "es_VE.UTF-8";
      LC_NUMERIC = "es_VE.UTF-8";
      LC_PAPER = "es_VE.UTF-8";
      LC_TELEPHONE = "es_VE.UTF-8";
      LC_TIME = "es_VE.UTF-8";
    };
  };
}