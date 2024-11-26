return {
    "iguanacucumber/magazine.nvim",
    name = "nvim-cmp", -- Otherwise highlighting gets messed up
    enabled = true,
    event = "InsertEnter",
    -- "hrsh7th/nvim-cmp",
    dependencies = {
        {
            "iguanacucumber/mag-buffer",
            name = "cmp-buffer"
        },
        { "https://codeberg.org/FelipeLema/cmp-async-path.git" },
        {
            "L3MON4D3/LuaSnip",
            dev = false,
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load({ paths = { "/home/deve/projects/snippets" } })
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        "saadparwaiz1/cmp_luasnip",
        { "iguanacucumber/mag-nvim-lsp",                       name = "cmp-nvim-lsp", opts = {} },
        { "iguanacucumber/mag-cmdline",                        name = "cmp-cmdline" },
        { "iguanacucumber/mag-nvim-lua",                       name = "cmp-nvim-lua" },
        {
            "Exafunction/codeium.nvim",
            enabled = true,
            opts = {
                enable_cmp_source = true
                -- enable_chat = true,
            },
        },
    },

    config = function()
        -- completion plugin setup
        local cmp = require("cmp")

        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                {
                    name = "cmdline",
                    option = {
                        ignore_cmds = { "Man", "!" },
                    },
                },
            }),
        })

        local luasnip = require("luasnip")
        local compare = require('cmp.config.compare')
        local types = require('cmp.types')
        cmp.setup({
            enabled = function()
                local disabled = false
                disabled = disabled or (vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'prompt')
                disabled = disabled or (vim.fn.reg_recording() ~= '')
                disabled = disabled or (vim.fn.reg_executing() ~= '')
                return not disabled
            end,

            performance = {
                debounce = 60,
                throttle = 30,
                fetching_timeout = 500,
                filtering_context_budget = 3,
                confirm_resolve_timeout = 80,
                async_budget = 1,
                max_view_entries = 200,
            },

            preselect = types.cmp.PreselectMode.Item,
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                -- ["<C-k>"] = cmp.mapping.select_prev_item(),
                -- ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-j>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-k>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                }),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),

            completion = {
                autocomplete = {
                    types.cmp.TriggerEvent.TextChanged,
                },
                completeopt = 'menu,menuone,noselect',
                keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
                keyword_length = 1,
            },

            formatting = {
                expandable_indicator = true,
                fields = { 'abbr', 'kind', 'menu' },
                format = function(_, vim_item)
                    return vim_item
                end,
            },

            matching = {
                disallow_fuzzy_matching = false,
                disallow_fullfuzzy_matching = false,
                disallow_partial_fuzzy_matching = true,
                disallow_partial_matching = false,
                disallow_prefix_unmatching = false,
                disallow_symbol_nonprefix_matching = true,
            },

            sorting = {
                priority_weight = 2,
                comparators = {
                    compare.offset,
                    compare.exact,
                    -- compare.scopes,
                    compare.score,
                    compare.recently_used,
                    compare.locality,
                    compare.kind,
                    -- compare.sort_text,
                    compare.length,
                    compare.order,
                },
            },
            sources = {
                { name = "codeium" },
                { name = "luasnip" },
                { name = "nvim_lsp" },
                {
                    name = "buffer",
                    option = {
                        get_bufnrs = function()
                            return vim.api.nvim_list_bufs()
                        end,
                    },
                },
                { name = 'async_path' }
                -- { name = "path" },
            },
            confirmation = {
                default_behavior = types.cmp.ConfirmBehavior.Insert,
                get_commit_characters = function(commit_characters)
                    return commit_characters
                end,
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
        })
    end,
}
