vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")

-- Make concise helpers for installing/adding plugins in two stages
local add = vim.pack.add
local now_if_args, later = Config.now_if_args, Config.later

now_if_args(function()
    -- Define hook to update tree-sitter parsers after plugin is updated
    local ts_update = function() vim.cmd("TSUpdate") end
    Config.on_packchanged("nvim-treesitter", { "update" }, ts_update, ":TSUpdate")

    add({
        "https://github.com/nvim-treesitter/nvim-treesitter",
        "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    })

    -- Define languages which will have parsers installed and auto enabled
    local languages = {
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
        "nix",
        "prisma",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "yaml",
    }
    local isnt_installed = function(lang)
        return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
    end
    local to_install = vim.tbl_filter(isnt_installed, languages)
    if #to_install > 0 then require("nvim-treesitter").install(to_install) end

    -- Enable tree-sitter after opening a file for a target language
    local filetypes = {}
    for _, lang in ipairs(languages) do
        for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
            table.insert(filetypes, ft)
        end
    end
    local ts_start = function(ev) vim.treesitter.start(ev.buf) end
    Config.new_autocmd("FileType", filetypes, ts_start, "Start tree-sitter")
end)

-- Language servers ===========================================================

now_if_args(function()
    add({ 'https://github.com/neovim/nvim-lspconfig' })

    vim.lsp.config("*", {
        capabilities = vim.lsp.protocol.make_client_capabilities(),
    })

    -- Use `:h vim.lsp.enable()` to automatically enable language server based on
    -- the rules provided by 'nvim-lspconfig'.
    -- Use `:h vim.lsp.config()` or 'after/lsp/' directory to configure servers.
    vim.lsp.enable({
        "bashls",
        "cssls",
        "docker-language-server",
        "eslint",
        "fish_lsp",
        "graphql",
        "html",
        "jsonls",
        "lua_ls",
        "nixd",
        "postgres_lsp",
        "prismals",
        "tailwindcss",
        "vtsls",
    })
end)

-- Color theme ================================================================

now_if_args(function()
    add({ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } })

    vim.cmd("color catppuccin-macchiato")
end)
