{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri;
    };
  };

  perSystem = { pkgs, lib, self', ... }: lib.optionalAttrs pkgs.stdenv.isLinux {
    packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.noctalia)
        ];

        xwayland-satellite.path =
          lib.getExe pkgs.xwayland-satellite;

        input.keyboard = {
          xkb.layout = "us,de";
        };

        layout.gaps = 5;

        binds = {
          "Mod+S".spawn-sh =
            "${lib.getExe self'.packages.noctalia} ipc call launcher toggle";
          "Mod+Return".spawn-sh = lib.getExe pkgs.rio;
        };
      };
    };
  };
}
