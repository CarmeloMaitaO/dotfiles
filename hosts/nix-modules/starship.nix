{ config, lib, pkgs, ... }:
{
  options = {
    starship.enable = lib.mkEnableOption "Enables the Starship prompt";
  };

  config = lib.mkIf config.starship.enable {
    # Starship
    environment.systemPackages = with pkgs; [
      starship
    ];
    programs.starship = {
      enable = true;
      interactiveOnly = false;
      # settings = {
      #   ;
      # };
    };
  };
}
