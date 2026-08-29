{self, inputs, ...}: {
  flake.nixosModules.gpg = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      gnupg
    ];
    programs.gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
  };
}
