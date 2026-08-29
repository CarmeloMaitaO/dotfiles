{self, inputs, ...}: {
  flake.nixosModules.audio = {pkgs, lib, ...}: {
    environment.systemPackages = with pkgs; [
      helvum
      pavucontrol
    ];
    services = {
      pulseaudio.enable = false;
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32bit = true;
        pulse.enable = true;
        jack.enable = true;
      };
    };
    security.rtkit.enable = true;
  };
}
