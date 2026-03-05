{ lib, config, pkgs, ... }:
{
  users.users.chiguire = {
    isNormalUser = true;
    description = "chiguire";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "scanner" "lp" "adbusers" "video" "render" ];
    shell = pkgs.bash;
  }; # users.users.chiguire
}
