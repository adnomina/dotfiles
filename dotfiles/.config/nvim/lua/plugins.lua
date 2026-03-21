vim.pack.add({ { src = "https://github.com/mason-org/mason.nvim" },
    {
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range("^1")
    },
    { src = "https://github.com/catppuccin/nvim" },
    { src = "https://github.com/folke/which-key.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/dmtrKovalenko/fff.nvim" },
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/lewis6991/gitsigns.nvim",
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
})

require("mason").setup()

require("blink.cmp").setup({
    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
        }
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    keymap = {
        preset = "default",
        ["<Tab>"] = {
            function(cmp)
                if cmp.snippet_active() then
                    return cmp.accept()
                else
                    return cmp.select_and_accept()
                end
            end,
            "snippet_forward",
            "fallback",
        },
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },
    signature = { enabled = true },
    sources = { default = { "lsp", "path", "buffer" } },
})

require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = false,
    term_colors = true,
})

require("lualine").setup()

require("gitsigns").setup({
    signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
    },
    signs_staged = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
    },
    on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc, silent = true })
        end

        -- stylua: ignore start
        map("n", "]h", function()
            if vim.wo.diff then
                vim.cmd.normal({ "]c", bang = true })
            else
                gs.nav_hunk("next")
            end
        end, "Next Hunk")
        map("n", "[h", function()
            if vim.wo.diff then
                vim.cmd.normal({ "[c", bang = true })
            else
                gs.nav_hunk("prev")
            end
        end, "Prev Hunk")
        map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
        map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")
        map({ "n", "x" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "x" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghB", function() gs.blame() end, "Blame Buffer")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
    end,
})

require("which-key").setup({
    preset = "helix",
    spec = {
        {
            mode = { "n", "x" },
            { "<leader>e", desc = "File explorer" },
            { "<leader>f", desc = "Format file" },
            { "<leader>d", desc = "Show diagnostics" },
            { "<leader>u", desc = "Update plugins" },
            { "[",         group = "prev" },
            { "]",         group = "next" },
            { "g",         group = "goto" },
            { "z",         group = "fold" },
            { "gx",        desc = "Open with system app" },
        },
    },
})
