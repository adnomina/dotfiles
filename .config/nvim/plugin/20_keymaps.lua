local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>")

-- Find with mini.pick
keymap.set("n", "<Leader>ff", "<Cmd>Pick files<CR>",     { desc = "Files" })
keymap.set("n", "<Leader>fg", "<Cmd>Pick grep_live<CR>", { desc = "Grep live" })
keymap.set("n", "<Leader>fb", "<Cmd>Pick buffers<CR>",   { desc = "Buffers" })
keymap.set("n", "<Leader>fh", "<Cmd>Pick help<CR>",      { desc = "Help tags" })
keymap.set("n", "<Leader>fr", "<Cmd>Pick resume<CR>",    { desc = "Resume" })

-- Explore current working directory
keymap.set("n", "<Leader>ed", function() MiniFiles.open() end, { desc = "Directory" })
-- Explore directory of the current file
keymap.set("n", "<Leader>ef", function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end, { desc = "File directory" })

-- Format the current buffer using LSP
keymap.set(
    "n",
    "<C-w>f",
    "<cmd>lua vim.lsp.buf.format()<CR>",
    { desc = "Format file" }
)
