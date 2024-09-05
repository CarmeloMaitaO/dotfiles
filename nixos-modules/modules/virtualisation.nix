{ config, lib, pkgs, ... }:

let
  cfg = config.virtualisation;
in

with pkgs.lib; {
  options = {
    virtualisation.enable = mkEnableOption "Enables Qemu/KVM and Waydroid";
  };

  config = mkIf cfg.enable {
    # Virtualisation
    virtualisation = {
      kvmgt.enable = true;
      waydroid.enable = true;
      libvirtd.enable = true;
      virt-manager.enable = true;
    };
  };
}

