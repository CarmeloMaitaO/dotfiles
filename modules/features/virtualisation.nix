{self, inputs, ...}: {
  flake.nixosModules.virtualisation = {pkgs, lib, ...}: {
    environment.systemPackages = with pkgs; [
      dnsmasq
    ];
    virtualisation.libvirtd = {
      enable = true;
      qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
    };
    programs.virt-manager.enable = true;
    networking.firewall.trustedInterfaces = [ "virbr0" ];
  };
}
