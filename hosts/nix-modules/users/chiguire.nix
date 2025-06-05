{ lib, config, pkgs, ... }:
{
  users.users.chiguire = {
    isNormalUser = true;
    description = "chiguire";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "scanner" "lp" "adbusers" ];
    shell = pkgs.bash;
  }; # users.users.chiguire
}
