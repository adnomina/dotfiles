local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>")

-- Find files via fzf
keymap.set("n", "<Space>f", function() require("fzf").find_files() end, { desc = "Find file" })

-- Format the current buffer using LSP
keymap.set(
    "n",
    "<C-w>f",
    "<cmd>lua vim.lsp.buf.format()<CR>",
    { desc = "Format file" }
)
