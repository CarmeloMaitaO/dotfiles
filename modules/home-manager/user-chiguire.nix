{ lib, config, pkgs, inputs, ... }:
{
  users.users.chiguire = {
    isNormalUser = true;
    description = "chiguire";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "scanner" "lp" ];
    shell = pkgs.zsh;
  };

}
