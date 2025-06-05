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
        model = "gemini:gemini-2.5-flash-preview-05-20";
        editor = "hx";
        "save_session" = true;
        wrap = 80;
        "wrap_code" = true;
        "sync_models_url" = "https://raw.githubusercontent.com/sigoden/aichat/refs/heads/main/models.yaml";
        "function_calling" = false;
        clients = [
          {
            type = "openrouter";
            "api_key" = (builtins.readFile /home/chiguire/Documents/secrets/openrouter);
          } # openrouter
          {
            type = "gemini";
            "api_key" = (builtins.readFile /home/chiguire/Documents/secrets/gemini);
          } # gemini
        ];
      };
    };
    "aichat/roles/prompt-maker-general.md" = {
      enable = true;
      force = true;
      source = /home/chiguire/Documents/prompts/prompt-maker-general.md;
    };
    "aichat/roles/prompt-maker-aichat.md" = {
      enable = true;
      force = true;
      source = /home/chiguire/Documents/prompts/prompt-maker-aichat.md;
    };
    "aichat/roles/aitutor.md" = {
      enable = true;
      force = true;
      source = /home/chiguire/Documents/prompts/aitutor.md;
    };
    "aichat/roles/nim-programmer.md" = {
      enable = true;
      force = true;
      source = /home/chiguire/Documents/prompts/nim-programmer.md;
    };
    "aichat/roles/qml-programmer.md" = {
      enable = true;
      force = true;
      source = /home/chiguire/Documents/prompts/qml-programmer.md;
    };
    "aichat/roles/dbml-programmer.md" = {
      enable = true;
      force = true;
      source = /home/chiguire/Documents/prompts/dbml-programmer.md;
    };
    "aichat/roles/sql-programmer.md" = {
      enable = true;
      force = true;
      source = /home/chiguire/Documents/prompts/sql-programmer.md;
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
    rio = {
      enable = true;
    };
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
}
