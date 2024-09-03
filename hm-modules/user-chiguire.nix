{ lib, config, pkgs, inputs, modulesPath, ... }:
{
  users.users.chiguire = {
    isNormalUser = true;
    description = "chiguire";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "scanner" "lp" ];
    shell = pkgs.zsh;
  };
  imports = [
    ./user-chiguire-packages.nix
  ];
}
