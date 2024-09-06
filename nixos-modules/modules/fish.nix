{ config, lib, pkgs, ... }:
{
  options = {
    fish.enable = lib.mkEnableOption "Sets Fish as the program to execute at the start of every Bash interactive shell";
  };

  config = lib.mkIf config.fish.enable {
    # Fish
    programs.fish = {
      enable = true;
    };
    programs.bash = {
      interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };
    users = {
      defaultUserShell = pkgs.bash;
      users.users.root.shell = pkgs.bash;
    };
  };
}

