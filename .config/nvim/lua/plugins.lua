vim.pack.add({
    "https://github.com/catppuccin/nvim",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/mason-org/mason.nvim"
})

vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")

require("catppuccin").setup({
    flavour = "macchiato",
    transparent_background = false,
    term_colors = true,
})

require("which-key").setup({
    preset = "classic",
    spec = {
        { "<Space>f", desc = "Find file" },
        {
            mode = { "n", "x" },
            { "gO",  desc = "Document Symbols" },
            { "gra", desc = "Code Action" },
            { "gri", desc = "Goto Implementation" },
            { "grn", desc = "Rename" },
            { "grr", desc = "References" },
            { "grt", desc = "Goto Type Definition" },
            { "grx", desc = "Run Code Lens" },
            { "K",   desc = "Hover" },
        },
    },
})

require("nvim-treesitter").install {
    "bash",
    "css",
    "diff",
    "dockerfile",
    "editorconfig",
    "ecma",
    "fish",
    "graphql",
    "html",
    "javascript",
    "json",
    "json5",
    "jsx",
    "lua",
    "nix",
    "prisma",
    "sql",
    "toml",
    "tsx",
    "typescript",
    "yaml",
}

require("mason").setup()
