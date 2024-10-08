{ config, lib, pkgs, inputs, ... }:
{
  home = {
    username = "chiguire";
    homeDirectory = "/home/chiguire";
    stateVersion = "23.11";
    packages = with pkgs; [
      thunderbird-bin
      itch
      lutris
      cartridges
      fluffychat
      nitch
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
      wezterm
      tuba
      vesktop
      telegram-desktop
      p7zip
      gnome-decoder
      neovim
      bruno
      sequeler
      citations
      libreoffice
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
      #krita
      #inkscape
      switcheroo
      ventoy
      dialect
      eartag
      paper-clip
      #blender
      bisq-desktop
      monero-gui
      clapper
      geogebra
      gnome-graphs
      blanket
      pomodoro-gtk
      gnome-obfuscate
      metadata-cleaner
      gnupg
      gnome-software
      pika-backup
      gnome-secrets
      ffmpeg
      video-trimmer
      pitivi
      freetube
      spotify
      newsflash
      wike
      amberol
      brasero
      colmena
      gnupg
      keeweb
      ldns
      nmap
      rdap
      whois
      wireguard-tools
      yt-dlp
      inputs.zen-browser.packages."${system}".generic
      nerdfonts
    ];
  };
  programs = {
    kitty = {
      enable = true;
      shellIntegration.enableFishIntegration = true;
    };
  };

}
