{self, inputs, ...}: {
  flake.nixosModules.capybara = {pkgs, lib, config, ...}: {
    imports = [
      self.nixosModules.nixconf
      self.nixosModules.capybaraHardware
      self.nixosModules.niri
      self.nixosModules.user
      self.nixosModules.git
      self.nixosModules.gpg
      self.nixosModules.audio
      self.nixosModules.bluetooth
      self.nixosModules.gaming
      self.nixosModules.printing
      self.nixosModules.virtualisation
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelModules = [ "kvm-intel" "v4l2loopback" "snd-aloop" ];
    boot.extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];
    boot.extraModprobeConfig = ''
      # exclusive_caps: Skype, Zoom, Teams etc. will only show device when actually streaming
      # card_label: Name of virtual camera, how it'll show up in Skype, Zoom, Teams
      # https://github.com/umlaeute/v4l2loopback
      options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
    '';
    networking = {
      hostName = "Capybara";
      networkmanager.enable = true;
      nameservers = [
        "1.1.1.1"
        "1.0.0.1"
      ];
    };
    environment = {
      variables = {
        EDITOR = "hx";
        VISUAL = "hx";
        PAGER = "cha";
        BROWSER = "brave";
      };
      sessionVariables = rec {
        XDG_CACHE_HOME  = "$HOME/.cache";
        XDG_CONFIG_HOME = "$HOME/.config";
        XDG_DATA_HOME   = "$HOME/.local/share";
        XDG_STATE_HOME  = "$HOME/.local/state";
        XDG_BIN_HOME = "$HOME/.local/bin";

        XDG_DESKTOP_DIR="$HOME/Desktop";
        XDG_DOCUMENTS_DIR="$HOME/Documents";
        XDG_DOWNLOAD_DIR="$HOME/Downloads";
        XDG_MUSIC_DIR="$HOME/Music";
        XDG_PICTURES_DIR="$HOME/Pictures";
        XDG_PUBLICSHARE_DIR="$HOME/Public";
        XDG_TEMPLATES_DIR="$HOME/Templates";
        XDG_VIDEOS_DIR="$HOME/Videos";
    
        PATH = [ 
          "${XDG_BIN_HOME}"
        ];
      };
    };

    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      liberation_ttf
      corefonts
    ];

    system.stateVersion = "26.05";

    environment.systemPackages = with pkgs; [
      starship
      zellij
      alacritty
      chawan
      helix
      hextazy
      nitch
      bc
      vivid
      onefetch
      p7zip-rar
      nushell
      yt-dlp
      ffmpeg-full
      pika-backup
      gnome-secrets
      aria2
      bottom
      brave
      tor-browser
      ttyper
      blender
      clapper
      clapper-enhancers
      onlyoffice-desktopeditors
      foliate
      eloquent
    ];

    time.timeZone = "America/Caracas";
    i18n = {
      defaultLocale = "en_US.UTF-8";
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
    };
    services.xserver.xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
  };
}
