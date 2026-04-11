# Neovim Configuration

## Overview

A minimal Neovim 0.12 setup using native plugin management (`vim.pack`) and built-in LSP support.

## Plugins

| Plugin | Purpose | Key Features |
|--------|---------|--------------|
| **catppuccin/nvim** | Color theme | Mocha flavor with true color support |
| **which-key.nvim** | Keybinding helper | Displays available keybindings and descriptions |
| **nvim-web-devicons** | File icons | Icons for different file types in explorer and statusline |
| **nvim-lspconfig** | LSP configurations | Language server protocol client configs |

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
- **Search**: Case-insensitive by default, case-sensitive when uppercase is typed (smartcase)
- **Undo persistence**: Undo history saved to `~/.vim/undodir`
- **Clipboard**: Sync with system clipboard (unnamedplus)
- **No swap files**: Swap file creation disabled
- **No mouse**: Mouse support disabled
- **Incremental command**: Live command preview without split
- **Update time**: 300ms (for CursorHold events)
- **Borders**: `winborder = rounded` applied globally; `pumborder = rounded` for completion popup; `pummaxwidth = 80`
- **UI2**: Experimental redesigned message/cmdline UI enabled (eliminates "Press ENTER" prompts)

### File Explorer (netrw)
- **Tree view**: List style with tree hierarchy
- **Window size**: 25% width
- **Splits**: Open files in previous window, new splits to the right
- **No banner**: Hide help banner

## Keyboard Shortcuts

### General

| Keybinding | Mode | Action |
|------------|------|--------|
| `jk` | Insert | Exit insert mode |
| `<C-w>f` | Normal | Format buffer (LSP) |

### LSP (buffer-local, set on attach)

| Keybinding | Mode | Action |
|------------|------|--------|
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |

**0.12 built-in defaults (no explicit mapping needed):**

| `gra` | Normal, Visual | Code action |
| `gri` | Normal | Go to implementation |
| `grn` | Normal | Rename symbol |
| `grr` | Normal | References |
| `grt` | Normal | Go to type definition |
| `grx` | Normal | Run code lens |
| `gO` | Normal | Document symbols |
| `<C-s>` | Insert | Signature help |

**Leader key**: Spacebar (`<Space>`)

## Configuration Details

### LSP

Installed via Nix and configured via native `vim.lsp.enable()` and `vim.lsp.config()`.

**Global capabilities** (all servers): workspace file operation notifications (`didRename`, `willRename`)

**Enabled servers:**

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

**On attach (per buffer):**
- Inlay hints enabled when supported by the server

### Diagnostics
- Underline enabled, virtual text disabled during insert mode
- Virtual text prefix `●`, spacing 4, source shown when multiple servers
- Severity-sorted with Nerd Font icons in the sign column
- Floating window on `CursorHold` (auto-closes on move/insert)

### Completion (native)
- Native `autocomplete` option (0.12 built-in, no plugin required)
- Fuzzy matching (`fuzzy`), documentation popup (`popup`), results sorted by distance to cursor (`nearest`)
- LSP completions via `completionItem/resolve` for documentation side window

### Visual Enhancements
- **Yank highlighting**: Highlighted text flashes for 150ms when copied
