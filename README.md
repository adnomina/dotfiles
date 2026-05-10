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
│   ├── aerospace/  # AeroSpace tiling window manager
│   ├── fish/       # Fish shell config and aliases
│   ├── ghostty/    # Ghostty terminal + Catppuccin theme
│   ├── karabiner/  # Karabiner-Elements: caps lock → ctrl
│   ├── nvim/       # Neovim (Lua, native vim.pack + vim.lsp)
│   ├── starship.toml  # Starship prompt (Catppuccin Mocha)
│   ├── tuna/       # Tuna launcher: leader mode bindings
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
| `aerospace` | Tiling window manager (from `nikitabobko/tap`) |
| `beekeeper-studio` | SQL editor and database manager |
| `firefox@developer-edition` | Firefox Developer Edition |
| `ghostty` | Ghostty terminal emulator |
| `karabiner-elements` | Keyboard remapper |
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

### Aerospace

Tiling window manager with 4 persistent workspaces.

**Main bindings:**

| Key | Action |
|-----|--------|
| `Alt-h/j/k/l` | Focus left/down/up/right |
| `Alt-Shift-h/l` | Previous / next workspace |

**Resize mode** (enter via Tuna `w → r`):

| Key | Action |
|-----|--------|
| `h/l` | Shrink / grow width by 50px |
| `j/k` | Shrink / grow height by 50px |
| `Enter` / `Esc` / `Ctrl-C` | Exit resize mode |

Floating windows: Bitwarden, 1Password, Tuna.

### Karabiner-Elements

Caps Lock → Control remap.

### Tuna Leader Mode

Leader key: tap right Option (`⌥`).

| Key | Action |
|-----|--------|
| `w` | **Aerospace** (submenu) |
| `f` | Finder |
| `t` | Terminal (Ghostty) |
| `e` | Editor (Zed) |
| `b` | Browser (Zen) |

#### Aerospace submenu (`w → …`)

| Key | Action |
|-----|--------|
| `1` / `2` / `3` / `4` | Switch to workspace 1–4 |
| `f` | Fullscreen |
| `r` | Enter resize mode |
| `l → h/v` | Layout h_accordion / v_accordion |
| `l → t` | Layout tiles |
| `l → f` | Toggle floating/tiling |
| `j → h/j/k/l` | Join with left/down/up/right |
| `m → h/j/k/l` | Move window left/down/up/right |
| `m → 1/2/3/4` | Move node to workspace 1–4 (focus follows) |

## Theme

[Catppuccin Mocha](https://github.com/catppuccin/catppuccin) is used consistently across Ghostty, WezTerm, Neovim, Starship, and Zed.
