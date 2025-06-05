{ config, lib, pkgs, ... }:
{
  environment.packages = with pkgs; [
    helix
    git
    man
    starship
    nushell
    yt-dlp
  ]; # environment.system.packages

  user.shell = "${pkgs.nushell}/bin/nu";
  home-manager =  {
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    config = { config, lib, pkgs, ... }: {
      home.stateVersion = "24.05";
      programs = {
        nushell = {
          enable = true;
        };
        starship = {
          enable = true;
          enableNushellIntegration = true;
        }; # starship
        helix = {
          enable = true;
          defaultEditor = true;
          settings = {
            theme = "gruvbox_dark_hard";
          };
        }; # helix
      }; # programs
    };
  }; # home-manager

  nix.extraOptions = "experimental-features = nix-command flakes";

  system.stateVersion = "24.05";
  environment.etcBackupExtension = ".backup";
  time.timeZone = "America/Caracas";
}
