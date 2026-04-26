local opt = vim.opt

-- Draw a vertical ruler at column 80 to mark the recommended line length
opt.colorcolumn = "80"
-- Hard-wrap lines at 80 characters when formatting text
opt.textwidth = 80

-- Always show the sign column (1 column wide) to avoid layout shifts
opt.signcolumn = "yes:1"
-- Enable 24-bit RGB color in the terminal
opt.termguicolors = true

-- Ignore case when searching
opt.ignorecase = true
-- Override ignorecase when the search pattern contains uppercase letters
opt.smartcase = true

-- Do not create swap files for open buffers
opt.swapfile = false

-- Copy indent from the current line when starting a new line
opt.autoindent = true
-- Insert spaces instead of tab characters
opt.expandtab = true
-- Number of spaces a <Tab> character represents visually
opt.tabstop = 4
-- Number of spaces inserted/removed when pressing <Tab>/<BS> in insert mode
opt.softtabstop = 4
-- Number of spaces used for each indentation level
opt.shiftwidth = 4
-- Round indent to a multiple of shiftwidth
opt.shiftround = true
-- Automatically insert extra indent after block-opening tokens
opt.smartindent = true

-- Show invisible characters using listchars symbols
opt.list = true
-- Define symbols for tab stops, trailing spaces, and non-breaking spaces
opt.listchars = "tab:| ,trail:-,nbsp:+"

-- Show absolute line numbers in the gutter
opt.number = true
-- Show relative line numbers for easy vertical motion
opt.relativenumber = true
-- Highlight the line the cursor is currently on
opt.cursorline = true

-- Preview substitution results incrementally without opening a split
opt.inccommand = "nosplit"

-- Directory where persistent undo history files are stored
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- Persist undo history to disk so it survives across sessions
opt.undofile = true

-- Enable the built-in autocomplete (ins-completion) feature
opt.autocomplete = true
-- Configure completion menu behaviour: fuzzy matching, popup style, no auto-insert
opt.completeopt = "fuzzy,menu,menuone,popup"
-- Use rounded borders for floating windows
opt.winborder = "rounded"
-- Use rounded borders for the completion popup menu
opt.pumborder = "rounded"
-- Cap the completion popup menu width at 80 columns
opt.pummaxwidth = 80

-- Sync the unnamed register with the system clipboard
opt.clipboard = "unnamedplus"

-- Reduce the delay before the CursorHold event fires (ms), used by plugins
opt.updatetime = 300
-- Disable mouse support entirely
opt.mouse = ""
-- Ask for confirmation instead of raising an error for unsaved changes
opt.confirm = true

-- Set <Space> as the leader key for custom mappings
vim.g.mapleader = " "

-- Configure netrw as a tree-style file explorer
vim.g.netrw_liststyle = 3
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 25
-- Hide the netrw banner to save screen space
vim.g.netrw_banner = 0
-- Open files in the previous window
vim.g.netrw_browse_split = 0
-- Open splits to the right
vim.g.netrw_altv = 1

-- Enable filetype detection, filetype plugins, and indent scripts
vim.cmd.filetype("plugin indent on")
-- Apply the Catppuccin colour scheme
vim.cmd.colorscheme("catppuccin")
-- Disable syntax highlighting (handled by a Tree-sitter plugin instead)
vim.cmd("syntax off")
