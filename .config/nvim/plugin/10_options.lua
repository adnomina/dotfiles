local opt = vim.opt

-- Draw a vertical ruler at column 80 to mark the recommended line length
opt.colorcolumn = "80"

-- Always show the sign column (1 column wide) to avoid layout shifts
opt.signcolumn = "yes:1"
-- Enable 24-bit RGB color in the terminal
opt.termguicolors = true

-- Ignore case when searching
opt.ignorecase = true
-- Override ignorecase when the search pattern contains uppercase letters
opt.smartcase = true

-- Copy indent from the current line when starting a new line
opt.autoindent = true
-- Insert spaces instead of tab characters
opt.expandtab = true
-- Number of spaces a <Tab> character represents visually
opt.tabstop = 4
-- Number of spaces used for each indentation level
opt.shiftwidth = 4
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

-- Persist undo history to disk so it survives across sessions
opt.undofile = true

-- Enable the built-in autocomplete (ins-completion) feature
opt.autocomplete = true
-- Configure completion menu behaviour
opt.completeopt = "menu,menuone,noselect,popup"
-- Use rounded borders for floating windows
opt.winborder = "rounded"
-- Use rounded borders for the completion popup menu
opt.pumborder = "rounded"
-- Cap the completion popup menu width at 80 columns
opt.pummaxwidth = 80

-- Sync the unnamed register with the system clipboard
opt.clipboard = "unnamedplus"

-- Disable mouse support entirely
opt.mouse = ""
-- Ask for confirmation instead of raising an error for unsaved changes
opt.confirm = true

-- Set <Space> as the leader key for custom mappings
vim.g.mapleader = " "


-- Enable filetype detection, filetype plugins, and indent scripts
vim.cmd.filetype("plugin indent on")
-- Disable syntax highlighting (handled by a Tree-sitter plugin instead)
vim.cmd("syntax off")
