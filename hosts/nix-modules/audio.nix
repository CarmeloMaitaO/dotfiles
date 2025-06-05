{ config, lib, pkgs, ... }:
{
  options = {
    audio.enable = lib.mkEnableOption "Enables Pipewire";
  };

  config = lib.mkIf config.audio.enable {
    # Audio
    services.pulseaudio = {
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
    environment.systemPackages = with pkgs; [
      helvum
      pavucontrol
    ];

  };
}

