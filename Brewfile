# Clone of cat(1) with syntax highlighting and Git integration
brew "bat"
# Simple, fast and user-friendly alternative to find
brew "fd"
# GitHub command-line tool
brew "gh"
# Post-modern modal text editor
brew "helix"
# Polyglot runtime manager (asdf rust clone)
brew "mise"
# Search tool like grep and The Silver Searcher
brew "ripgrep"
# Cross-shell prompt for astronauts
brew "starship"
# Organize software neatly under a single directory tree (e.g. /usr/local)
brew "stow"
# Very fast implementation of tldr in Rust
brew "tealdeer"
# Shell extension to navigate your filesystem faster
brew "zoxide"
brew "fzf"
brew "gnupg"
brew "jq"
brew "git"
brew "tree-sitter"
brew "fish"

cask "font-monaspace-nf"

if OS.linux?
  flatpak "com.discordapp.Discord"
  flatpak "com.valvesoftware.Steam"
  flatpak "dev.zed.Zed"
  flatpak "org.mozilla.firefox"
end

if OS.mac?
  tap "docker/tap", trusted: true

  # Agent multiplexer that lives in your terminal
  brew "herdr"

  # Web browser
  cask "firefox"
  # Terminal emulator that uses platform-native UI and GPU acceleration
  cask "ghostty"
  cask "claude-code"
  cask "copilot-cli"
  brew "opencode"
  # Universal database tool and SQL client
  cask "dbeaver-community"
  # App to build and share containerised applications and microservices
  cask "docker-desktop"
  # Knowledge base that works on top of a local folder of plain text Markdown files
  cask "obsidian"
  # Build, run, and govern agents across the software development lifecycle
  cask "docker/tap/sbx", trusted: true
  # Team communication and collaboration software
  cask "slack"
  # REST, GraphQL and gRPC client
  cask "yaak"
  # Multiplayer code editor
  cask "zed"
end
