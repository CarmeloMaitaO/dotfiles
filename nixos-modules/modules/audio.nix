{ config, lib, pkgs, ... }:

let
  cfg = config.audio;
in

with pkgs.lib; {
  options = {
    audio.enable = mkEnableOption "Enables Pipewire";
  };

  config = mkIf cfg.enable {
    # Audio
    hardware.pulseaudio = {
      enable = false;
    };
    security.rtkit = {
      enable = true;
    };
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

  };
}

