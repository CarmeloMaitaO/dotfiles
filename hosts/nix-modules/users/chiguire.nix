{ lib, config, pkgs, ... }:
{
  users.users.chiguire = {
    isNormalUser = true;
    description = "chiguire";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "scanner" "lp" "adbusers" "video" "render" ];
    shell = pkgs.dash;
  }; # users.users.chiguire
}
