{ self, inputs, ... }: {
  flake.darwinModules.macBookProConfiguration = { pkgs, lib, ... }: {
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep <package>
    environment.systemPackages = with pkgs; [
      # Language servers
      bash-language-server
      basedpyright
      docker-language-server
      docker-compose-language-service
      fish-lsp
      graphql-language-service-cli
      nixd
      prisma-language-server
      tailwindcss-language-server
      typescript-language-server
      vscode-css-languageserver
      vscode-json-languageserver
      yaml-language-server

      # Utils
      coreutils
      findutils
      gawk
      gnused

      # Editors
      neovim

      # TUI apps
      glow
    ];

    # Necessary for using flakes on this system.
    nix.settings.experimental-features = "nix-command flakes";

    # Set Git commit hash for darwin-version.
    system.configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 6;

    system.primaryUser = "nicolas";

    system.defaults = {
      dock.autohide = true;
      finder.FXPreferredViewStyle = "clmv";
      loginwindow.GuestEnabled = false;
      NSGlobalDomain.AppleInterfaceStyle = "Dark";
    };

    system.keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };

    system.activationScripts.postActivation.text = ''
      echo "Run this from the repo root to symlink dotfiles:"
      echo "  stow ."
    '';

    nixpkgs = {
      # The platform the configuration will be used on.
      hostPlatform = "aarch64-darwin";

      # Allow unfree packages.
      config.allowUnfree = true;
    };
  };
}
