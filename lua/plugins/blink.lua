return {
    "saghen/blink.cmp",
    enabled = false,
    version = "v0.*",
    event = { "LspAttach", "InsertCharPre" },
    dependencies = {
        {
            "Exafunction/codeium.nvim",
            enabled = true,
        },
        {
            "L3MON4D3/LuaSnip",
            dev = false,
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load({ paths = { "/home/deve/projects/snippets" } })
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        { "saghen/blink.compat", opts = { impersonate_nvim_cmp = true } },
    },
    opts = {
        highlight = {
            -- use_nvim_cmp_as_default = true,
        },
        fuzzy = {
            sorts = { "label", "kind", "score" },
            -- prebuilt_binaries = {
            --     force_version = "v0.7.3",
            -- },
        },
        nerd_font_variant = "normal",
        snippets = {
            expand = function(snippet)
                require("luasnip").lsp_expand(snippet)
            end,
            active = function(filter)
                if filter and filter.direction then
                    return require("luasnip").jumpable(filter.direction)
                end
                return require("luasnip").in_snippet()
            end,
            jump = function(direction)
                require("luasnip").jump(direction)
            end,
        },

        sources = {
            completion = {
                enabled_providers = {
                    "luasnip",
                    "lsp",
                    "path",
                    "buffer",
                    -- "codeium"
                },
            },

            providers = {
                -- codeium = {
                --     name = "codeium",
                --     module = "blink.compat.source",
                --     score_offset = -3,
                -- },
            },
            trigger = {
                show_on_insert_on_trigger_character = false,
            },
        },

        keymap = {
            preset = "enter",
            ["<C-space>"] = { "show", 'hide' },
            ["<C-S-k>"] = { "show_documentation", "hide_documentation", 'fallback' },
            ["<C-e>"] = { "hide", "fallback" },
            ["<S-Tab>"] = { "snippet_backward", "fallback" },


            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-l>"] = { "accept", "fallback" },
            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },
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

        completion = {
            accept = { auto_brackets = { enabled = true } },
            menu = {
                draw = {
                    -- columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
                    columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
                },
                -- border = "rounded",
            },
            documentation = {
                auto_show = true,
                -- window = {
                --     border = "single",
                -- },
            },
        },
    },
    opts_extend = { "sources.completion.enabled_providers" },
}
