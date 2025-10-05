{ config, lib, pkgs, ... }:
{
  options = {
    virtualisation.enable = lib.mkEnableOption "Enables Qemu/KVM and Waydroid";
  };

  config = lib.mkIf config.virtualisation.enable {
    # Virtualisation
    virtualisation = {
      kvmgt.enable = true;
      waydroid.enable = true;
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };
    programs.virt-manager.enable = true;
  };
}

