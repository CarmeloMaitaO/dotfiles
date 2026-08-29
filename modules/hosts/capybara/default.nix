{self, inputs, ...}: {
  flake.nixosConfigurations.capybara = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.capybara
    ];
  };
}
