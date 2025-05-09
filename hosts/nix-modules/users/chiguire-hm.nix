{ lib, config, pkgs, inputs, ... }:
{
  home = {
    username = "chiguire";
    homeDirectory = "/home/chiguire";
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
    yt-dlp = {
      enable = true;
      settings = {
        cookies-from-browser = "chromium";
        embed-metadata = true;
        embed-chapters = true;
        embed-thumbnail = true;
        embed-subs = true;
        sub-langs = "live_chat,en,en.*,it,es,de,gsw,pt,fr";
        convert-subs = "ass";
        merge-output-format = "mkv";
        remux-video = "mkv";
      };
      extraConfig =
      ''
        --yes-playlist
        --progress
        --audio-multistreams
        --video-multistreams
      '';
    }; # yt-dlp
    aria2 = {
      enable = true;
      settings = {
        continue = true;
        max-tries = 0;
        max-concurrent-downloads = 8;
        max-connections-per-server = 4;
        seed-time = 60;
        dir = "/home/chiguire/Downloads";
      };
    }; # aria2
  }; # programs
}
