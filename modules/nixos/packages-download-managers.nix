{ config, lib, pkgs, ... }:
{
  config = {
    environment.systemPackages = with pkgs; [
      varia
      parabolic
      aria
    ];
  };
}
