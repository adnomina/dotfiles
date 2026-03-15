# MacBook Setup

Automated setup for a fresh macOS (Apple Silicon) development environment. A single script installs all software via Homebrew, symlinks dotfiles via GNU Stow, and configures the shell, terminal, and editors.

## Quick Start

```bash
git clone https://github.com/adnomina/macbook-setup.git
cd macbook-setup
bash setup.sh
```

The script will:

1. Install [Homebrew](https://brew.sh) (if not already installed)
2. Disable Homebrew analytics
3. Install all packages from the `Brewfile`
4. Symlink dotfiles into `$HOME` using [GNU Stow](https://www.gnu.org/software/stow/)
5. Set [Fish](https://fishshell.com) as the default login shell
6. Restart into Fish

> Requires `sudo` access (for adding Fish to `/etc/shells`).

## What Gets Installed

### Packages

| Package | Description |
|---------|-------------|
| `fish` | Fish shell |
| `gh` | GitHub CLI |
| `git` | Version control |
| `mise` | Polyglot runtime version manager |
| `neovim` (HEAD) | Neovim, built from latest source |
| `postgresql@18` | PostgreSQL database |
| `tree-sitter` | Parser generator tool |
| `tree-sitter-cli` | Tree-sitter CLI |
| `yazi` | Terminal file manager |

### Casks

| Cask | Description |
|------|-------------|
| `aerospace` | Tiling window manager (from `nikitabobko/tap`) |
| `beekeeper-studio` | SQL editor and database manager |
| `copilot-cli` | GitHub Copilot CLI |
| `firefox@developer-edition` | Firefox Developer Edition |
| `font-jetbrains-mono-nerd-font` | JetBrains Mono Nerd Font |
| `ghostty` | Ghostty terminal emulator |
| `obsidian` | Markdown note-taking |
| `slack` | Team messaging |
| `thunderbird` | Email client |
| `yaak` | API client |
| `zed` | Zed code editor |

## Dotfiles

Dotfiles are organized as [GNU Stow](https://www.gnu.org/software/stow/) packages under `dotfiles/` and symlinked into `$HOME/.config/`:

```
dotfiles/
├── aerospace/      # Aerospace tiling window manager config
├── fish/           # Fish shell config
├── ghostty/        # Ghostty terminal config + Catppuccin theme
├── nvim/           # Neovim config (Lua, native vim.pack + vim.lsp)
├── starship/       # Starship prompt config
├── tmux/           # Tmux config
├── wezterm/        # WezTerm terminal emulator config
└── zed/            # Zed editor settings + keybindings
```

## Theme

[Catppuccin Mocha](https://github.com/catppuccin/catppuccin) is used consistently across Ghostty, Neovim, and Zed.
