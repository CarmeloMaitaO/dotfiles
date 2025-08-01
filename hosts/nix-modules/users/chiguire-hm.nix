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
  xdg.configFile = {
    "aichat/dark.tmTheme" = {
      enable = true;
      force = true;
      source = inputs.tmtheme-gruvbox;
    };
    "aichat/config.yaml" = {
      enable = true;
      force = true;
      text = lib.generators.toYAML { } {
        model = "gemini:gemini-2.5-flash";
        editor = "hx";
        "save_session" = true;
        #wrap = 80;
        "wrap_code" = true;
        "sync_models_url" = "https://raw.githubusercontent.com/sigoden/aichat/refs/heads/main/models.yaml";
        "function_calling" = true;
        clients = [
          {
            type = "gemini";
            "api_key" = (builtins.readFile /home/chiguire/Documents/secrets/gemini);
          } # gemini
        ];
      };
    };
    "aichat/roles/prompt-maker.md" = {
      enable = true;
      force = true;
      source = ../../../config-files/aichat/roles/prompt-maker.md;
    };
    "aichat/roles/business-chief-officers.md" = {
      enable = true;
      force = true;
      source = ../../../config-files/aichat/roles/business-chief-officers.md;
    };
    "aichat/roles/commit-message-generator.md" = {
      enable = true;
      force = true;
      source = ../../../config-files/aichat/roles/commit-message-generator.md;
    };
    "aichat/roles/conversation-summarizer.md" = {
      enable = true;
      force = true;
      source = ../../../config-files/aichat/roles/conversation-summarizer.md;
    };
    "aichat/roles/homework-maker.md" = {
      enable = true;
      force = true;
      source = ../../../config-files/aichat/roles/homework-maker.md;
    };
    "aichat/roles/language-definitions-generator.md" = {
      enable = true;
      force = true;
      source = ../../../config-files/aichat/roles/language-definitions-generator.md;
    };
    "aichat/roles/public-relations-manager.md" = {
      enable = true;
      force = true;
      source = ../../../config-files/aichat/roles/public-relations-manager.md;
    };
    "aichat/roles/questions-and-answers.md" = {
      enable = true;
      force = true;
      source = ../../../config-files/aichat/roles/questions-and-answers.md;
    };
    "aichat/roles/requirements-engineer.md" = {
      enable = true;
      force = true;
      source = ../../../config-files/aichat/roles/requirements-engineer.md;
    };
    "aichat/roles/schema-generator.md" = {
      enable = true;
      force = true;
      source = ../../../config-files/aichat/roles/schema-generator.md;
    };
    "aichat/roles/systems-engineer.md" = {
      enable = true;
      force = true;
      source = ../../../config-files/aichat/roles/systems-engineer.md;
    };
  };
  stylix.targets.helix.enable = false;
  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
      toggle-fullscreen = [
        "<Super>F11"
      ];
    };
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = false;
      night-light-temperature = 2700;
      night-light-schedule-from = 0;
      night-light-schedule-to = 0;
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
        dir = "/home/chiguire/Downloads";
      };
    }; # aria2
  }; # programs
  services = {
    mpd = {
      enable = true;
      musicDirectory = /home/chiguire/Music;
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "MPD Pipewire output"
        }
      '';
    }; # mpd
  }; # services
}
