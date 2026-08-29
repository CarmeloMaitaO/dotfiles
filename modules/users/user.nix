{self, inputs, ...}: {
  flake.nixosModules.user = {pkgs, ...}: {
    users.users.chiguire = {
      isNormalUser = true;
      description = "chiguire";
      extraGroups = [
        "wheel"
        "libvirtd"
        "scanner"
        "lp"
        "video"
        "render"
        "networkmanager"
      ];
      shell = pkgs.dash;
    }; # users.users.chiguire
  };
}
