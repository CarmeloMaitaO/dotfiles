{self, inputs, ...}: {
  flake.nixosModules.git = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      git
    ];
    programs.git ={
      enable = true;
      config = [{
        init = {
          defaultBranch = "main";
        };
        url = {
          "https://github.com/" = {
            insteadOf = [
              "gh:"
              "github:"
            ];
          };
        };
        user = {
          name = "Carmelo Maita";
          email = "carmeloaugustomaitaorlando@gmail.com";
        };
      }];
    };
  };
}
