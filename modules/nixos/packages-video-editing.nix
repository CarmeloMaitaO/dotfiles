{ config, lib, pkgs, ... }:
{
  config = {
    environment.systemPackages = with pkgs; [
      ffmpeg-full
      video-trimmer
      pitivi
    ];
  };
}
