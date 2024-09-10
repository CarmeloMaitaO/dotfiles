{ config, lib, pkgs, inputs, ... }:
{
  home = {
    username = "chiguire";
    homeDirectory = "/home/chiguire";
    stateVersion = "23.11";
    packages = with pkgs; [
      floorp
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
      nerdfonts
    ];
  };
  programs = {
    kitty = {
      enable = true;
      shellIntegration.enableFishIntegration = true;
    };
  };
  #gtk.iconTheme = {
  #  package = pkgs.gruvbox-plus-icons;
  #  name = "Gruvbox-Plus-Dark";
  #};
}
