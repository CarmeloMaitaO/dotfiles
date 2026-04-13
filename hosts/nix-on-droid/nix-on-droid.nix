{ config, lib, pkgs, ... }:
{
  environment.packages = with pkgs; [
    gemini-cli
    openssh
    zip
    nodejs
    gnutar
    vivid
    bc
    onefetch
    p7zip-rar
    hextazy
    nitch
    helix
    git
    starship
    nushell
  ]; # environment.system.packages

  nix.extraOptions = "experimental-features = nix-command flakes";

  system.stateVersion = "24.05";
  environment.etcBackupExtension = ".backup";
  time.timeZone = "America/Caracas";
}
