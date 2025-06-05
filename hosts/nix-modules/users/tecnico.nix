{ lib, config, pkgs, ... }:
{
  users.users.tecnico = {
    isNormalUser = true;
    description = "tecnico";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "scanner" "lp" ];
    shell = pkgs.bash;
  }; # users.users.tecnico
}
