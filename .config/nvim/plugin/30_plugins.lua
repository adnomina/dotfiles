vim.pack.add({
    "https://github.com/catppuccin/nvim",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/nvim-mini/mini.nvim",
})

vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")

require("catppuccin").setup({
    flavour = "macchiato",
    transparent_background = false,
    term_colors = true,
})

-- Apply the Catppuccin colour scheme
vim.cmd.colorscheme("catppuccin")

require("which-key").setup({
    preset = "classic",
    spec = {
        { "<Leader>f", desc = "+Find" },
        { "<Leader>e", desc = "+Explore" },
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

-- Fuzzy finder for files, grep, buffers, help, and more
require("mini.pick").setup()

-- File explorer with column view and preview
require("mini.files").setup({ windows = { preview = true } })

-- Add common bookmarks whenever the explorer opens
vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesExplorerOpen",
    callback = function()
        MiniFiles.set_bookmark("c", vim.fn.stdpath("config"), { desc = "Config" })
        MiniFiles.set_bookmark("p", vim.fn.stdpath("data") .. "/site/pack/core/opt", { desc = "Plugins" })
        MiniFiles.set_bookmark("w", vim.fn.getcwd, { desc = "Working directory" })
    end,
})
