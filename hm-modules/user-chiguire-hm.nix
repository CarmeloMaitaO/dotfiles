{ config, lib, pkgs, inputs, ... }:
{
  home = {
    username = "chiguire";
    homeDirectory = "/home/chiguire";
    stateVersion = "23.11";
    packages = with pkgs; [
      floorp
      firefox
      fluffychat
      # yazi
      yazi
      poppler
      jq
      ffmpegthumbnailer
      fd
      ripgrep
      fzf
      wl-clipboard
      xclip
      imagemagick
      #
      nemo
      #openscad
      #freecad
      #brlcad
      kitty
      foot
      tuba
      vesktop
      whatsapp-for-linux
      telegram-desktop
      #evolution
      p7zip
      collision
      gnome-decoder
      neovim
      bruno
      sequeler
      citations
      libreoffice
      varia
      parabolic
      aria
      foliate
      gnucash
      prismlauncher
      cool-retro-term
      nethack
      shattered-pixel-dungeon
      git
      conjure
      krita
      inkscape
      switcheroo
      ventoy
      dialect
      eartag
      paper-clip
      #blender
      bisq-desktop
      monero-gui
      clapper
      citations
      logseq
      geogebra
      gnome-graphs
      blanket
      solanum
      gnome-obfuscate
      metadata-cleaner
      gnupg
      gnome.gnome-software
      pika-backup
      gnome-secrets
      ffmpeg
      video-trimmer
      pitivi
      freetube
      newsflash
      wike
      amberol
      brasero
      colmena
      evolution
      gnupg
      keeweb
      ldns
      nmap
      pomodoro-gtk
      solanum
      rdap
      whois
      wireguard-tools
      yt-dlp
      inputs.zen-browser.packages."${system}".generic
      gruvbox-plus-icons
      nerdfonts
    ];
  };
  stylix = {
    enable = true;
    image = inputs.bg-chiguire;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 32;
    };
    fonts = {
      serif = {
        package = pkgs.nerdfonts;
        name = "0xProto";
      };

      sansSerif = {
        package = pkgs.nerdfonts;
        name = "Go Mono";
      };

      monospace = {
        package = pkgs.nerdfonts;
        name = "0xProto";
      };

      emoji = {
        package = pkgs.nerdfonts;
        name = "Noto Color Emoji";
      };
    };
  };
}
