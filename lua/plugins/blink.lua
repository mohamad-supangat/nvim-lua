return
{
    "saghen/blink.cmp",
    enabled = false,
    -- event = { "LspAttach", "InsertCharPre" },
    dependencies = {
        {
            "Exafunction/codeium.nvim",
            enabled = true,
            opts = {
                enable_cmp_source = true
                -- enable_chat = true,
            },
        },
        {
            "L3MON4D3/LuaSnip",
            dev = false,
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load({ paths = { "/home/deve/projects/snippets" } })
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        "saadparwaiz1/cmp_luasnip",
        { 'saghen/blink.compat', opts = { impersonate_nvim_cmp = true } }
    },
    opts = {
        highlight = {
            use_nvim_cmp_as_default = true,
        },
        nerd_font_variant = "normal",
        accept = {
            -- auto_brackets = { enabled = true },
            expand_snippet = function(snippet) require('luasnip').lsp_expand(snippet) end,
        },

        sources = {
            completion = {
                enabled_providers = { 'lsp', 'path', 'snippets', 'buffer', 'codeium' },
            },

            providers = {
                luasnip = {
                    name = 'luasnip',
                    module = 'blink.compat.source',
                    score_offset = -3,
                    opts = {
                        use_show_condition = false,
                        show_autosnippets = true,
                    },
                },
                codeium = {
                    name = "codeium",
                    module = 'blink.compat.source',
                    score_offset = -3,
                }
            },
        },


        keymap = {
            preset        = 'enter',
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>']     = { 'hide', 'fallback' },
            ['<S-Tab>']   = { 'snippet_backward', 'fallback' },

            ['<Up>']      = { 'select_prev', 'fallback' },
            ['<Down>']    = { 'select_next', 'fallback' },
            ['<C-k>']     = { 'select_prev', 'fallback' },
            ['<C-j>']     = { 'select_next', 'fallback' },

            ['<C-b>']     = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>']     = { 'scroll_documentation_down', 'fallback' },
        },

        -- trigger = { signature_help = { enabled = true } },
        --
        -- keymap = {
        --     show = "<C-space>",
        --     hide = { "<C-d>" },
        --     accept = { "<CR>", "<Tab>" },
        --     select_prev = { "<Up>", "<C-p>", "<C-k>" },
        --     select_next = { "<Down>", "<C-n>", "<C-j>" },
        --     show_documentation = {},
        --     hide_documentation = {},
        --     scroll_documentation_up = "<C-y>",
        --     scroll_documentation_down = "<C-e>",
        -- },

        windows = {
            autocomplete = {
                border = "rounded",
            },
            documentation = {
                border = "rounded",
            },
        },
    },
    opts_extend = { "sources.completion.enabled_providers" }
}
