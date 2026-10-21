{ self, inputs, ... }: {
  flake.darwinConfigurations.macBookPro = inputs.nix-darwin.lib.darwinSystem {
    modules = [
      self.darwinModules.macBookProConfiguration
    ];
  };
}
