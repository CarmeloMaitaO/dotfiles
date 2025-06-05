{ config, lib, pkgs, ... }:
{
  options = {
    nushell.enable = lib.mkEnableOption "Sets Nushell as the program to execute at the start of every Bash interactive shell";
  };

  config = lib.mkIf config.nushell.enable {
    # Nushell
    programs.bash = {
      interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "nu" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.nushell}/bin/nu $LOGIN_OPTION
        fi
      '';
    };
    users = {
      defaultUserShell = pkgs.bash;
      users.root.shell = pkgs.bash;
    };
  };
}

