{ config, lib, pkgs, ... }:
{
  environment.packages = with pkgs; [
    pinentry-curses
    gnupg
    openssh
    vivid
    bc
    onefetch
    hextazy
    git
    starship
    nushell
    helix
    # zellij
  ]; # environment.system.packages

  user.shell = "${lib.getExe pkgs.nushell}";

  # Nix-on-Droid Android Integration
  android-integration.termux-open.enable = true;

  # Terminal Colors (Gruvbox Dark Hard)
  terminal.colors = {
    foreground = "#ebdbb2";
    background = "#1d2021";
    color0 = "#1d2021";
    color1 = "#cc241d";
    color2 = "#98971a";
    color3 = "#d79921";
    color4 = "#458588";
    color5 = "#b16286";
    color6 = "#689d6a";
    color7 = "#a89984";
    color8 = "#928374";
    color9 = "#fb4934";
    color10 = "#b8bb26";
    color11 = "#fabd2f";
    color12 = "#83a598";
    color13 = "#d3869b";
    color14 = "#8ec07c";
    color15 = "#fbf1c7";
  };

  nix.extraOptions = "experimental-features = nix-command flakes";

  system.stateVersion = "24.05";
  environment.etcBackupExtension = ".backup";
  time.timeZone = "America/Caracas";
}
