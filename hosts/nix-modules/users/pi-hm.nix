{ lib, config, pkgs, inputs, ... }:
{
  home = {
    username = "pi";
    homeDirectory = "/home/pi";
    stateVersion = "24.11";
    file = {
      ".config/helix/config.toml" = {
        enable = true;
        source = ../../../config-files/helix/config.toml;
        force = true;
      }; # helix
      ".config/nixpkgs/config.nix" = {
        enable = true;
        source = ../../../config-files/nixpkgs/config.nix;
        force = true;
      }; # nixpkgs
    };
    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "hx";
      PAGER = "less";
      BROWSER = "brave";
      SHELL = "nu";
      TERMINAL = "ghostty";
      TERM = "ghostty";
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
        cookies-from-browser = "brave";
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
        dir = "/home/pi/Downloads";
      };
    }; # aria2
  }; # programs
  services = {
    mpd = {
      enable = true;
      musicDirectory = /home/pi/Music;
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "MPD Pipewire output"
        }
      '';
    }; # mpd
  }; # services
}
