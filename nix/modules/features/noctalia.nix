{ self, inputs, ... }: {
  perSystem = { pkgs, lib, ... }: lib.optionalAttrs pkgs.stdenv.isLinux {
    packages.noctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      inherit pkgs;
      settings =
        (builtins.fromJSON
          (builtins.readFile ./noctalia.json)).settings;
    };
  };
}
