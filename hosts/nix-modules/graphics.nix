{ config, lib, pkgs, ... }:
{
  options = {
    graphics.enable = lib.mkEnableOption "Enables HW Acceleration and install Intel's GPU drivers";
  };

  config = lib.mkIf config.graphics.enable {
    # Graphics
    services.xserver.videoDrivers = [ "modesetting" ];
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        vpl-gpu-rt
        intel-media-driver
        intel-compute-runtime
      ];
    };

    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = "iHD";
    };

    hardware.enableRedistributableFirmware = true;

  };
}

