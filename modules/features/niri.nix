{self, inputs, ...}: {
  flake.nixosModules.niri = {pkgs, lib, ...}: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };

    services = {
      displayManager.gdm = {
        enable = true;
      };
    };
    programs.dconf = {
      enable = true;
    };
  };
  perSystem = {pkgs, lib, self', ...}: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.myNoctalia)
        ];
        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
        input.keyboard = {
          xkb.layout = "us-intl";
        };
        layout.gaps = 5;
        binds = {
          "Mod+Return".spawn-sh = lib.getExe pkgs.alacritty;
          "Mod+Q".close-window = {};
          "Mod+S".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
        };
      }; # settings
    }; # packages.myNiri
  };
}
