-- Global capabilities for all LSP servers
local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("*", {
    capabilities = capabilities,
})

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

vim.diagnostic.config({
    underline = true,
    update_in_insert = false,
    virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
    },
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
        },
    },
})
