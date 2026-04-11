local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>")

-- Format the current buffer using LSP
keymap.set(
    "n",
    "<C-w>f",
    "<cmd>lua vim.lsp.buf.format()<CR>",
    { desc = "Format file" }
)
