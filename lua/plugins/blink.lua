return {
    "saghen/blink.cmp",
    enabled = true,
    version = "v0.*",
    event = { "LspAttach", "InsertCharPre" },
    dependencies = {
        {
            "aliaksandr-trush/codeium.nvim",
            enabled = true,
            branch = 'blink',
            opts = {
                enable_cmp_source = false
                -- enable_chat = true,
            },
        },
        {
            "L3MON4D3/LuaSnip",
            dev = false,
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load({ paths = { "/home/deve/.config/nvim/snippets/" } })
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
    },
    opts = {
        enabled = function()
            return not vim.tbl_contains(require('variables').exclude, vim.bo.filetype)
                and vim.bo.buftype ~= "prompt"
                and vim.b.completion ~= false
        end,
        fuzzy = {
            sorts = { "score", "label" },
            -- prebuilt_binaries = {
            --     force_version = "v0.7.3",
            -- },
        },
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
            default = {
                "codeium",
                "luasnip",
                "lsp",
                "path",
                "buffer",
            },
            providers = {
                codeium = {
                    name = 'Codeium',
                    module = 'codeium.blink',
                    async = true,
                    score_offset = 1000,
                    transform_items = function(_, items)
                        local CompletionItemKind = require('blink.cmp.types').CompletionItemKind
                        local kind_idx = #CompletionItemKind + 1
                        CompletionItemKind[kind_idx] = 'Codeium'
                        for _, item in ipairs(items) do
                            item.kind = kind_idx
                        end
                        return items
                    end,
                },
            },
        },

        keymap = {
            preset = "none",
            ['<CR>'] = { 'accept', 'fallback' },
            ["<C-space>"] = { "show", 'hide' },
            ["<C-S-k>"] = { "show_documentation", "hide_documentation", 'fallback' },
            ["<C-e>"] = { "hide", "fallback" },


            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<Tab>"] = { "select_next", "fallback" },
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },

            -- ["<C-l>"] = { "accept", "fallback" },
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
            keyword = { range = 'full' },
            accept = { auto_brackets = { enabled = false } },
            list = { selection = 'preselect' },
            menu = {
                auto_show = function(ctx)
                    return ctx.mode ~= 'cmdline' or
                        not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
                end,
                draw = {
                    -- columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
                    gap = 2,
                    columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
                    components = {
                        kind_icon = {
                            ellipsis = false,
                            text = function(ctx)
                                local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                                return kind_icon
                            end,
                            highlight = function(ctx)
                                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                                return hl
                            end,
                        }
                    }
                },
                -- border = "rounded",
                -- winhighlight =
                -- 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
                window = {
                    -- border = "rounded",
                    -- winhighlight =
                    -- 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
                },
            },
            trigger = {
                show_on_trigger_character = false,
                show_on_insert_on_trigger_character = false,
                show_on_accept_on_trigger_character = false,
            },
            ghost_text = { enabled = false },
        },
        -- signature = { window = { border = 'single' } },
        appearance = {
            use_nvim_cmp_as_default = true,
            -- nerd_font_variant = 'mono'
        },
    },
    opts_extend = {
        "sources.default",
        "sources.completion.enabled_providers"
    },
}
