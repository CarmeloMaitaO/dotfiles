{ config, lib, pkgs, ... }:
{
  config = {
    environment.systemPackages = with pkgs; [
      bisq-desktop
      monero-gui
    ];
  };
}
