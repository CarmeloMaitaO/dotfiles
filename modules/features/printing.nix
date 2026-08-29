{self, inputs, ...}: {
  flake.nixosModules.printing = {pkgs, lib, ...}: {
    environment.systemPackages = with pkgs; [
      simple-scan
    ];
    services = {
      printing.enable = true;
      printing.drivers = with pkgs; [
        cups-filters
        cups-browsed
      ];
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
      udev.packages = with pkgs; [
        sane-airscan
        utsushi
      ];
    }; # services
    hardware.sane = {
      enable = true;
      extraBackends = with pkgs; [
        sane-airscan
        hplipWithPlugin
        utsushi
      ];
    };
  };
}
