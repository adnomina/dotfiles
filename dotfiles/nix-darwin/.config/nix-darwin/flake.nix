{
    description = "nix-darwin system flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        nix-darwin.url = "github:nix-darwin/nix-darwin/master";
        nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs@{ self, nix-darwin, nixpkgs }:
    let
        configuration = { pkgs, ... }: {
            # List packages installed in system profile. To search by name, run:
            # $ nix-env -qaP | grep wget
            environment.systemPackages =
                [
                    pkgs.bat
                    pkgs.btop
                    pkgs.colima
                    pkgs.coreutils
                    pkgs.claude-code
                    pkgs.docker
                    pkgs.docker-compose
                    pkgs.findutils
                    pkgs.gawk
                    pkgs.gnused
                    pkgs.gnupg
                    pkgs.jq
                    pkgs.nil
                    pkgs.ripgrep
                    pkgs.starship
                    pkgs.stow
                    pkgs.tealdeer
                    pkgs.tmux
                    pkgs.opencode
                ];

            # Necessary for using flakes on this system.
            nix.settings.experimental-features = "nix-command flakes";

            # Enable alternative shell support in nix-darwin.
            programs.fish.enable = true;

            # Set Git commit hash for darwin-version.
            system.configurationRevision = self.rev or self.dirtyRev or null;

            # Used for backwards compatibility, please read the changelog before changing.
            # $ darwin-rebuild changelog
            system.stateVersion = 6;

            nixpkgs = {
                # The platform the configuration will be used on.
                hostPlatform = "aarch64-darwin";

                # Allow unfree packages.
                config.allowUnfree = true;
            };
        };
    in
        {
            # Build darwin flake using:
            # $ darwin-rebuild build --flake .#Nicks-MacBook-Pro
            darwinConfigurations."Nicks-MacBook-Pro" = nix-darwin.lib.darwinSystem {
                modules = [ configuration ];
            };
        };
}
