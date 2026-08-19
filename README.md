# dotfiles

Development environment setup for macOS (Apple Silicon) and Linux. System packages are managed via [Nix](https://nixos.org) and [nix-darwin](https://github.com/nix-darwin/nix-darwin); dotfiles are symlinked via [GNU Stow](https://www.gnu.org/software/stow/).

## Quick Start

**1. Install Nix** (if not already installed):

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

**2. Clone the repo:**

```bash
git clone https://github.com/adnomina/dotfiles.git
cd dotfiles
```

**3. Apply the Nix configuration** (installs all packages and sets Fish as default shell):

```bash
sudo darwin-rebuild switch --flake ./nix
```

**4. Symlink dotfiles:**

```bash
stow .
```

## Structure

```
dotfiles/
├── .config/
│   ├── fish/       # Fish shell config and aliases
│   ├── ghostty/    # Ghostty terminal + Catppuccin theme
│   ├── nvim/       # Neovim (Lua, native vim.pack + vim.lsp)
│   ├── starship.toml  # Starship prompt (Catppuccin Mocha)
│   ├── wezterm/    # WezTerm terminal emulator
│   └── zed/        # Zed editor settings + keybindings
└── nix/            # Nix flake (system packages + macOS defaults)
```

## What Gets Installed

Packages are declared in `nix/flake.nix`. Nix manages most software; Homebrew is used only for packages unavailable in nixpkgs.

### Nix Packages

| Package | Description |
|---------|-------------|
| `bat` | Cat clone with syntax highlighting |
| `claude-code` | Claude Code CLI |
| `coreutils` | GNU core utilities |
| `docker` | Container tooling |
| `findutils` | GNU find utilities |
| `fnm` | Fast node manager |
| `fzf` | Fuzzy finder |
| `gawk` | GNU awk |
| `gh` | GitHub CLI |
| `git` | Version control |
| `gnupg` | GNU Privacy Guard |
| `gnused` | GNU sed |
| `jq` | JSON processor |
| `neovim` | Text editor |
| `nerd-fonts.jetbrains-mono` | JetBrains Mono Nerd Font |
| `nerd-fonts.monaspace` | Monaspace Nerd Font |
| `nil` / `nixd` | Nix language servers |
| `obsidian` | Markdown note-taking |
| `opencode` | OpenCode CLI |
| `ripgrep` | Fast regex search |
| `slack` | Team messaging |
| `starship` | Cross-shell prompt |
| `stow` | Symlink farm manager |
| `tealdeer` | tldr pages client |
| `tree-sitter` | Parser generator + CLI |

### Homebrew Casks (via nix-homebrew)

| Cask | Description |
|------|-------------|
| `beekeeper-studio` | SQL editor and database manager |
| `firefox@developer-edition` | Firefox Developer Edition |
| `ghostty` | Ghostty terminal emulator |
| `yaak` | API client |
| `zed` | Zed code editor |

### System Defaults (macOS)

Applied automatically by nix-darwin:

- Dark mode enabled
- Dock auto-hide enabled
- Finder column view (`clmv`)
- Guest login disabled
- Fish set as default shell
- Rosetta enabled (for compatibility)

## Updating

```bash
cd ~/dotfiles/nix
nix flake update
darwin-rebuild switch --flake .
```

## Dotfiles

### Fish Shell

Aliases and integrations in `.config/fish/config.fish`:

| Alias | Command |
|-------|---------|
| `vi`, `vim` | `nvim` |
| `cat`, `less` | `bat` |
| `cc` | `claude` |
| `oc` | `opencode` |
| `la` | `ls -la` |

Integrations: `starship init`, pnpm.

## Theme

[Catppuccin Mocha](https://github.com/catppuccin/catppuccin) is used consistently across Ghostty, WezTerm, Neovim, Starship, and Zed.
