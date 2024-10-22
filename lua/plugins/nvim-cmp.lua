return {
    "iguanacucumber/magazine.nvim",
    name = "nvim-cmp", -- Otherwise highlighting gets messed up
    enabled = true,
    event = "InsertEnter",
    -- "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        {
            "L3MON4D3/LuaSnip",
            dev = false,
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load({ paths = { "/home/deve/projects/snippets" } })
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        -- "hrsh7th/cmp-nvim-lua",
        -- {
        --     "hrsh7th/vim-vsnip",
        --     init = function()
        --         vim.g.vsnip_snippet_dir = "/home/deve/projects/snippets/snippets"
        --     end,
        -- },
        -- "hrsh7th/cmp-vsnip",
        -- "hrsh7th/cmp-cmdline",
        {
            "Exafunction/codeium.nvim",
            enabled = true,
            -- commit = "937667b2cadc7905e6b9ba18ecf84694cf227567",
            opts = {
                -- enable_chat = true,
            },
        },
    },

    config = function()
        -- completion plugin setup
        local cmp = require("cmp")
        -- cmp.setup.cmdline("/", {
        --     mapping = cmp.mapping.preset.cmdline(),
        --     sources = {
        --         { name = "buffer" },
        --     },
        -- })
        -- cmp.setup.cmdline(":", {
        --     mapping = cmp.mapping.preset.cmdline(),
        --     sources = cmp.config.sources({
        --         { name = "path" },
        --     }, {
        --         {
        --             name = "cmdline",
        --             option = {
        --                 ignore_cmds = { "Man", "!" },
        --             },
        --         },
        --     }),
        -- })

        local luasnip = require("luasnip")
        cmp.setup({
            view = {
                entries = "custom",
            },
            snippet = {
                expand = function(args)
                    -- vim.fn["vsnip#anonymous"](args.body)
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
            -- formatting = {
            --     format = require("lspkind").cmp_format({
            --         -- before = require("tailwind-tools.cmp").lspkind_format,
            --         mode = "symbol_text",
            --         maxwidth = 100,
            --         ellipsis_char = "...",
            --         symbol_map = { Codeium = "" },
            --     }),
            -- },
            sources = {
                { name = "codeium" },
                { name = "luasnip" },
                { name = "nvim_lsp" },
                -- { name = "nvim_lua" },
                -- { name = "vsnip" },
                {
                    name = "buffer",
                    option = {
                        get_bufnrs = function()
                            return vim.api.nvim_list_bufs()
                        end,
                    },
                },
                { name = "path" },
            },
            confirm_opts = { behavior = cmp.ConfirmBehavior.Replace, select = false },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sorting = {
                comparators = {
                    cmp.config.compare.score,
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
            -- experimental = { ghost_text = false },
        })
    end,
}
