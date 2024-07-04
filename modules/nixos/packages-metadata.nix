{ config, lib, pkgs, ... }:
{
  config = {
    environment.systemPackages = with pkgs; [
      eartag
      paper-clip
    ];
  };
}
