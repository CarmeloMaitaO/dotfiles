{ config, lib, pkgs, ... }:
{
  options = {
    graphics.enable = lib.mkEnableOption "Enables HW Acceleration and install Intel's GPU drivers";
  };

  config = lib.mkIf config.graphics.enable {
    # Graphics
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        vpl-gpu-rt
	intel-media-sdk
	intel-vaapi-driver
	libvdpau-va-gl
      ];
      extraPackages32 = with pkgs; [
        intel-vaapi-driver
      ];
    };

  };
}

