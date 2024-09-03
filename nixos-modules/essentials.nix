{ config, lib, pkgs, ... }:

let
  cfg = config.essentials;
in

with pkgs.lib; {
  options = {
    essentials = {
      localeVE = mkEnableOption "Sets the locales for VE";
      keymapUS = mkEnableOption "Sets the keymap for a US keyboard";
      networking = mkEnableOption "Enables NetworkManager";
      nix = mkEnableOption "Configures Nix to enable flakes and substituters";
      fish = mkEnableOption "Enables the Fish shell and makes Bash execute it as the interactive shell for users";
    };
  };

  config = {
    # Locale VE
    time = mkIf cfg.localeVE {
      timeZone = "America/Caracas";
    };
    i18n = mkIf cfg.localeVE {
      defaultLocale = "en_US.UTF-8";
    };
    extraLocaleSettings = {
      LC_ADDRESS = "es_VE.UTF-8";
      LC_IDENTIFICATION = "es_VE.UTF-8";
      LC_MEASUREMENT = "es_VE.UTF-8";
      LC_MONETARY = "es_VE.UTF-8";
      LC_NAME = "es_VE.UTF-8";
      LC_NUMERIC = "es_VE.UTF-8";
      LC_PAPER = "es_VE.UTF-8";
      LC_TELEPHONE = "es_VE.UTF-8";
      LC_TIME = "es_VE.UTF-8";
    };

    # Keymap US
    services.xserver = mkIf cfg.keymapUS {
      xkb = {
        layout = "us";
	variant = "intl";
      };
    };
    console = mkIf cfg.keymapUS {
      keymap = "us-acentos";
    };

    # Networking
    networking.networkmanager = mkIf cfg.networking {
      enable = true;
    };

    # Fish
    programs.fish = mkIf cfg.fish {
      enable = true;
    };
    programs.bash = mkIf cfg.fish {
      interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };
    users = mkIf cfg.fish {
      defaultUserShell = pkgs.bash;
      users.users.root.shell = pkgs.bash;
    };

    # Nix
    nixpkgs.config = mkIf cfg.nix {
      allowUnfree = true;
      allowBroken = true;
      allowInsecurePredicate = pkg: true;
    };
    nix.settings = mkIf cfg.nix {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    nix.settings = mkIf cfg.nix {
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];

      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
    nix = mkIf cfg.nix {
      optimise.automatic = true;
      settings.auto-optimise-store = true;
    };
    

  };
}
