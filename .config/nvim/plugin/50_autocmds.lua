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
