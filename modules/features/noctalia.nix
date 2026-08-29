{self, inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.myNoctalia = input.wrapper-modules.wrappers.noctalia-shell.wrap {
      settings = (builtins.fromJSON(builtins.readFile ./noctalia.json)).settings;
    };
  };
};
