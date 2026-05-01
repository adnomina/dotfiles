local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight yanked text
local highlight_group = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ timeout = 150 })
    end,
    group = highlight_group,
})

-- Show floating diagnostic window on hover
autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, {
            focusable = false,
            scope = "cursor",
            close_events = { "BufLeave", "CursorMoved", "InsertEnter" },
        })
    end,
})

autocmd("FileType", {
    pattern = {
        "bash", "css", "diff", "dockerfile", "editorconfig",
        "fish", "graphql", "html", "javascript", "javascriptreact",
        "json", "json5", "lua", "nix", "prisma", "sql", "toml",
        "typescript", "typescriptreact", "yaml",
    },
    callback = function() vim.treesitter.start() end,
})

autocmd("FileType", {
    pattern = "help",
    command = "wincmd L",
})

autocmd("LspAttach", {
    group = augroup("lsp_completion", { clear = true }),
    callback = function(args)
        local client_id = args.data.client_id
        if not client_id then
            return
        end

        local client = vim.lsp.get_client_by_id(client_id)
        if client and client:supports_method("textDocument/completion") then
            -- Enable native LSP completion for this client and buffer
            vim.lsp.completion.enable(true, client_id, args.buf, {
                autotrigger = true,
            })
        end
    end,
})

autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == "nvim-treesitter" and kind == "update" then
            if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
            vim.cmd("TSUpdate")
        end
    end
})
