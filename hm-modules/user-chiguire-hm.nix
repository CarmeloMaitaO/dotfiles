{ config, lib, pkgs, inputs, ... }:
{
  home = {
    username = "chiguire";
    homeDirectory = "/home/chiguire";
    stateVersion = "24.11";
  };
  stylix.targets.helix.enable = false;
  programs = {
    helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = "gruvbox_dark_hard";
        editor = {
          mouse = false;
          middle-click-paste = false;
          line-number = "relative";
          auto-completion = false;
          rulers = [ 80 ];
          statusline = {
            left = [ "mode" "file-name" "file-modification-indicator" ];
            center = [ "version-control" ];
            right = [ "spinner" "position" "position-percentage" ];
            separator = " ";
            mode = {
              normal = "NORMAL";
              insert = "INSERT";
              select = "SELECT";
            };
          };
        };
      };
    }; # helix
    rio = {
      enable = true;
      settings = {
        cursor = {
          shape = "block";
          blinking = true;
          blinking-interval = 800;
        };
        fonts = {
          family = "0xproto";
          size = 20;
        };
        colors = {
          background = "#1b1b1b";
          foreground = "#ebdbb2";
          selection-background = "#665c54";
          selection-foreground = "#ebdbb2";
          cursor = "#ebdbb2";
          black = "#1b1b1b";
          red = "#cc241d";
          green = "#98971a";
          yellow = "#d79921";
          blue = "#458588";
          magenta = "#b16286";
          cyan = "#689d6a";
          white = "#a89984";
          light_black = "#928374";
          light_red = "#fb4934";
          light_green = "#b8bb26";
          light_yellow = "#fabd2f";
          light_blue = "#83a598";
          light_magenta = "#d3869b";
          light_cyan = "#8ec07c";
          light_white = "#ebdbb2";
        };
      };
    }; # rio
    firefox = {
      enable = true;
      profiles = {
        chiguire = {
          isDefault = true;
        };
      };
    }; # firefox
  };

}
