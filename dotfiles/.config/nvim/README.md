# Neovim Configuration

## Overview

A minimal Neovim 0.12 setup using native plugin management (`vim.pack`) and built-in LSP support.

## Plugins

| Plugin | Purpose | Key Features |
|--------|---------|--------------|
| **mason.nvim** | LSP/tool installer | Manages language server installation |
| **blink.cmp** | Completion engine | Rust-based fuzzy completion, LSP/buffer sources, documentation preview |
| **catppuccin/nvim** | Color theme | Mocha flavor with true color support |
| **which-key.nvim** | Keybinding helper | Displays available keybindings and descriptions |
| **nvim-web-devicons** | File icons | Icons for different file types in explorer and statusline |
| **lualine.nvim** | Status line | Minimal status/info line at bottom of window |
| **fff.nvim** | Fuzzy file finder | Fast file search with fuzzy matching |
| **nvim-lspconfig** | LSP configurations | Language server protocol client configs |
| **gitsigns.nvim** | Git integration | Git signs in the sign column, hunk navigation and staging |
| **nvim-treesitter** | Syntax highlighting | Tree-sitter based parsing and highlighting |

## Editor Settings

### Display
- **Line numbers**: Relative line numbers with absolute at cursor position
- **Color column**: 80-character guide at column 80
- **Text width**: Wrap at 80 characters
- **Cursor line**: Highlight current line
- **True colors**: Full 24-bit color support
- **Sign column**: Always visible (1-width) for diagnostics and git marks
- **Whitespace**: Visible tab, trailing space, and non-breaking space indicators

### Indentation
- **Type**: Spaces (expandtab)
- **Size**: 4 spaces per tab
- **Smart indent**: Enabled for automatic indentation
- **Shift round**: Round indent to nearest multiple of shiftwidth

### Behavior
- **Case-insensitive search**: Ignore case in search patterns
- **Undo persistence**: Undo history saved to `~/.vim/undodir`
- **Clipboard**: Sync with system clipboard (unnamedplus)
- **No swap files**: Swap file creation disabled
- **No mouse**: Mouse support disabled
- **Incremental command**: Live command preview without split
- **Update time**: 300ms (for CursorHold events)
- **Diagnostics**: Inline virtual text enabled

### File Explorer (netrw)
- **Tree view**: List style with tree hierarchy
- **Window size**: 25% width
- **Splits**: Open files in previous window, new splits to the right
- **No banner**: Hide help banner

## Keyboard Shortcuts

| Keybinding | Mode | Action |
|------------|------|--------|
| `jk` | Insert | Exit insert mode |
| `<Leader>f` | Normal | Format buffer (LSP) |
| `<Leader>d` | Normal | Show diagnostics |
| `<Leader>u` | Normal | Update plugins |
| `<Leader>e` | Normal | Open file explorer |
| `grd` | Normal | Go to definition (LSP) |
| `ff` | Normal | Find files (fff.nvim) |
| `<C-u>` | Normal | Page up (centered) |
| `<C-d>` | Normal | Page down (centered) |
| `<leader>?` | Normal | Show buffer keymaps (which-key) |
| `<C-w><Space>` | Normal | Window hydra mode (which-key) |
| `]h` / `[h` | Normal | Next/prev git hunk |
| `]H` / `[H` | Normal | Last/first git hunk |
| `<leader>ghs` | Normal, Visual | Stage hunk |
| `<leader>ghr` | Normal, Visual | Reset hunk |
| `<leader>ghS` | Normal | Stage buffer |
| `<leader>ghu` | Normal | Undo stage hunk |
| `<leader>ghR` | Normal | Reset buffer |
| `<leader>ghp` | Normal | Preview hunk inline |
| `<leader>ghb` | Normal | Blame line (full) |
| `<leader>ghB` | Normal | Blame buffer |
| `<leader>ghd` | Normal | Diff this |
| `<leader>ghD` | Normal | Diff this (against last commit) |
| `ih` | Operator, Visual | Select hunk (text object) |

**Leader key**: Spacebar (`<Space>`)

## Configuration Details

### LSP Servers

Enabled via `vim.lsp.enable()`:

| Server | Language |
|--------|----------|
| `bashls` | Bash/Shell |
| `cssls` | CSS |
| `eslint` | JavaScript/TypeScript linting |
| `graphql` | GraphQL |
| `html` | HTML |
| `jsonls` | JSON |
| `lua_ls` | Lua |
| `prismals` | Prisma |
| `sqlls` | SQL |
| `tailwindcss` | Tailwind CSS |
| `vtsls` | TypeScript/JavaScript |

### Treesitter Languages

Auto-installed on new machines: `javascript`, `typescript`, `tsx`, `css`, `html`, `json`, `graphql`, `lua`, `markdown`, `markdown_inline`

### Completion (blink.cmp)
- Fuzzy matching with Rust implementation for performance
- LSP, path, and buffer sources
- Automatic documentation preview (200ms delay)
- Tab to accept completions or expand snippets
- `<C-b>` / `<C-f>` to scroll documentation
- `<C-k>` to show function signatures

### Git (gitsigns.nvim)
- Custom Nerd Font signs: `▎` for add/change/untracked, `` for delete
- Staged changes shown with separate sign set
- Hunk navigation respects diff mode (`]c`/`[c`) vs normal mode
- `ih` text object for selecting hunks in operator/visual mode

### Keybinding Helper (which-key.nvim)
- Helix preset style
- Displays available keybindings when you start typing a key sequence
- Shows descriptions for all mapped commands with leader key groups labeled
- `<leader>?` to show all buffer-local keymaps
- `<C-w><Space>` for interactive window hydra mode

### fff.nvim
- Lazy sync mode enabled for performance
- Debug mode with match score display
- Binary auto-downloads on plugin updates

### Floating Diagnostics
- Automatically displayed on cursor hold (CursorHold event)
- Shows LSP diagnostics for current position
- Auto-closes on buffer leave, cursor movement, or insert mode

### Visual Enhancements
- **Yank highlighting**: Highlighted text flashes for 150ms when copied
