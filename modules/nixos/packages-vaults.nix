{ config, lib, pkgs, ... }:
{
  config = {
    environment.systemPackages = with pkgs; [
      pika-backup
      gnome-secrets
    ];
  };
}
