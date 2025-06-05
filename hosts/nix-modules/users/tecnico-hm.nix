{ lib, config, pkgs, inputs, ... }:
{
  home = {
    username = "tecnico";
    homeDirectory = "/home/tecnico";
    stateVersion = "24.11";
    file = {
      ".config/helix/config.toml" = {
        enable = true;
        source = ../../../config-files/helix/config.toml;
        force = true;
      }; # helix
    };
  };
  stylix.targets.helix.enable = false;
  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
      toggle-fullscreen = [
        "F11"
      ];
    };
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = false;
    };
  }; # dconf.settings
  gtk = {
    enable = true;
    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    }; # iconTheme
  };
  programs = {
    starship = {
      enable = true;
      enableNushellIntegration = true;
    }; # starship
    nushell = {
      enable = true;
    }; # nushell
    chromium = {
      enable = true;
      dictionaries = with pkgs; [
        hunspellDictsChromium.en_US
      ];
      extensions = [
        { id = "epcnnfbjfcgphgdmggkamkmgojdagdnn"; } # Ublock
        { id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp"; } # Privacy Badger
        { id = "ldpochfccmkkmhdbclfhpagapcfdljkj"; } # Descentraleyes
      ];
    }; # chromium
  }; # programs
}
