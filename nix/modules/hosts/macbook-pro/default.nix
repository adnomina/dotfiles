{ self, inputs, ... }: {
  flake.darwinConfigurations.macBookPro = inputs.nix-darwin.lib.darwinSystem {
    modules = [
      self.nixosModules.macBookProConfiguration
      inputs.nix-homebrew.darwinModules.nix-homebrew
      {
        nix-homebrew = {
          enable = true;
          enableRosetta = true;
          user = "nicolas";
          autoMigrate = true;
        };
      }
    ];
  };
}
