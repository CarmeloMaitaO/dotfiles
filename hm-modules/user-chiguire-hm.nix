{ config, lib, pkgs, inputs, ... }:
{
  home = {
    username = "chiguire";
    homeDirectory = "/home/chiguire";
    stateVersion = "23.11";
  };
  stylix.targets.helix.enable = false;
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = {
      "monitor" = ",preferred,0x0,1";
      "$mainMod" = "SUPER";
      "$terminal" = "rio";
      "$fileManager" = "rio -e yazi";
      "$browser" = "firefox";
      "$torbrowser" = "tor-browser";
      "$tuibrowser" = "rio -e elinks";
      "$dashboard" = "rio -e wtfutil";
      "$music" = "rio -e termusic";
      "$wikipedia" = "rio -e wiki-tui";
      "$rss" = "rio -e newsboat";
      "$mail" = "rio -e aerc";
      "$translate" = "dialect";
      "$secrets" = "secrets";
      "$menu" = "wofi -S drun";
      "$raisevolume" = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
      "$lowervolume" = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-";
      "$mute" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      "$micmute" = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
      "exec-once" = [
        "hyprpaper"
        "mako"
      ];
      "env" = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];
      "general" = {
        "border_size" = "2";
        "layout" = "master";
      };
      "input" = {
        "kb_layout" = "us";
        "kb_variant" = "intl";
        "kb_model" = "pc104";
        "kb_options" = "terminate:ctrl_alt_bksp";
        "follow_mouse" = "1";
      };
      "misc" = {
        "force_default_wallpaper" = "0";
        "disable_hyprland_logo" = "true";
      };
      "bind" = [
        "$mainMod, BACKSPACE, killactive, "
        "$mainMod SHIFT, F, togglefloating, "
        "$mainMod SHIFT, ESCAPE, execr, \"systemctl poweroff\" "
        "$mainMod, ESCAPE, execr, \"systemctl suspend\" "
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, F, exec, $fileManager"
        "$mainMod, B ,exec, $browser"
        "$mainMod SHIFT, B ,exec, $tuibrowser"
        "$mainMod SHIFT CTRL, B ,exec, $torbrowser"
        "$mainMod, M, exec, $mail"
        "$mainMod, T, exec, $translate"
        "$mainMod, L, exec, $menu"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, mouse:272, movewindow "
      ];
      "bindm" = [
        "$mainMod, mouse:272, movewindow "
        "$mainMod, mouse:273, resizewindow "
      ];
      "bindel" = [
        "$mainMod, XF86AudioRaiseVolume, exec, $raisevolume"
        "$mainMod, F8, exec, $raisevolume"
        "$mainMod, XF86AudioLowerVolume, exec, $lowervolume"
        "$mainMod, F7, exec, $lowervolume"
        "$mainMod, XF86AudioMuteVolume, exec, $mute"
        "$mainMod, F5, exec, $mute"
        "$mainMod, XF86AudioMicMuteVolume, exec, $micmute"
        "$mainMod, F6, exec, $micmute"
      ];
    };
  };
  services = {
    mako = {
      enable = true;
    };
    hypridle = {
      enable = true;
    }; # hypridle
    hyprpaper = {
      enable = true;
    };
  };
  programs = {
    hyprlock = {
      enable = true;
    }; # hyprlock
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
    }; # helix
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
