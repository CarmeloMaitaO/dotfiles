{ config, lib, pkgs, ... }:
{
  environment.packages = with pkgs; [
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
    man
    starship
    nushell
  ]; # environment.system.packages

  user.shell = "${pkgs.nushell}/bin/nu";

  nix.extraOptions = "experimental-features = nix-command flakes";

  system.stateVersion = "24.05";
  environment.etcBackupExtension = ".backup";
  time.timeZone = "America/Caracas";
}
