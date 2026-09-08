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
      gvfs.enable = true;
      udisks2.enable = true;
    };
    programs.dconf = {
      enable = true;
    };
    environment.systemPackages = with pkgs; [
      nautilus
    ];
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
          xkb.layout = "us";
          xkb.variant = "altgr-intl";
        };
        layout.gaps = 5;
        binds = {
          "Mod+Return".spawn-sh = lib.getExe pkgs.alacritty;
          "Mod+S".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
          "Mod+Print".spawn-sh = ''
            ${lib.getExe pkgs.grim}
          '';
          "Mod+Shift+Print".spawn-sh = ''
            ${lib.getExe pkgs.grim} -g "$(${lib.getExe pkgs.slurp} -w 0)"
          '';
          "Mod+O".toggle-overview = {};
          "Mod+Shift+E".quit = {};
          "Mod+Q".close-window = {};
          "Mod+F".maximize-column = {};
          "Mod+Shift+F".fullscreen-window = {};
          "Mod+Ctrl+Up".set-window-height = "+5%";
          "Mod+Ctrl+Down".set-window-height = "-5%";
          "Mod+Ctrl+Left".set-column-width = "-5%";
          "Mod+Ctrl+Right".set-column-width = "+5%";
          "Mod+Left".focus-column-left = {};
          "Mod+Right".focus-column-right = {};
          "Mod+Up".focus-window-up = {};
          "Mod+Down".focus-window-down = {};
          "Mod+Prior".focus-workspace-up = {};
          "Mod+Next".focus-workspace-down = {};
          "Mod+Shift+Up".move-window-up = {};
          "Mod+Shift+Down".move-window-down = {};
          "Mod+Shift+Left".move-column-left = {};
          "Mod+Shift+Right".move-column-right = {};
          "Mod+Shift+Prior".move-column-to-workspace-up = {};
          "Mod+Shift+Next".move-column-to-workspace-down = {};
          "Mod+WheelScrollUp".focus-workspace-up = {};
          "Mod+WheelScrollDown".focus-workspace-down = {};
        };
      }; # settings
    }; # packages.myNiri
  };
}
