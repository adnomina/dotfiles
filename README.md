# dotfiles

Development environment setup for macOS (Apple Silicon) and Linux. Packages are managed via [Homebrew](docs.brew.sh); dotfiles are symlinked via [GNU Stow](https://www.gnu.org/software/stow/).

## Quick Start

**1. Clone the repo:**

```bash
git clone https://github.com/adnomina/dotfiles.git
cd dotfiles
```

**2. Install packages:**

```bash
brew bundle install
```

**3. Symlink dotfiles:**

```bash
stow .
```

## Theme

[Catppuccin Mocha](https://github.com/catppuccin/catppuccin) is used consistently across Ghostty, WezTerm, Neovim, Starship, and Zed.
