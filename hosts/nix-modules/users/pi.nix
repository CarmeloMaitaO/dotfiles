{ lib, config, pkgs, ... }:
{
  users.users.pi = {
    isNormalUser = true;
    description = "pi";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "scanner" "lp" "adbusers" ];
    shell = pkgs.bash;
  }; # users.users.pi
}
