vim.pack.add({
    "https://github.com/catppuccin/nvim",
    "https://github.com/dmtrKovalenko/fff.nvim",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-treesitter/nvim-treesitter",
})

vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")

require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = false,
    term_colors = true,
})

require("which-key").setup({
    preset = "helix",
    spec = {
        {
            mode = { "n", "x" },
            { "<leader>c",  group = "code" },
            { "<leader>cD", desc = "Workspace Diagnostics" },
            { "<leader>e",  desc = "File explorer" },
            { "<leader>f",  desc = "Format file" },
            { "<leader>d",  desc = "Show diagnostics" },
            { "<leader>u",  desc = "Update plugins" },
            { "<leader>U",  desc = "Undotree" },
            { "<leader>g",  group = "git" },
            { "<leader>gh", group = "hunks" },
            { "[",          group = "prev" },
            { "[d",         desc = "Prev Diagnostic" },
            { "[D",         desc = "Prev Error" },
            { "]",          group = "next" },
            { "]d",         desc = "Next Diagnostic" },
            { "]D",         desc = "Next Error" },
            { "g",          group = "goto" },
            { "gra",        desc = "Code Action" },
            { "gri",        desc = "Goto Implementation" },
            { "grn",        desc = "Rename" },
            { "grr",        desc = "References" },
            { "grt",        desc = "Goto Type Definition" },
            { "grx",        desc = "Run Code Lens" },
            { "gO",         desc = "Document Symbols" },
            { "gx",         desc = "Open with system app" },
            { "z",          group = "fold" },
            { "K",          desc = "Hover" },
            { "<C-W>d",     desc = "Show Diagnostic" },
        },
        {
            mode = "i",
            { "<C-s>", desc = "Signature Help" },
        },
    },
})
