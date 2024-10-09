return {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    enabled = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v3.x",
            lazy = true,
            config = false,
            init = function()
                -- Disable automatic setup, we are doing it manually
                vim.g.lsp_zero_extend_cmp = 0
                vim.g.lsp_zero_extend_lspconfig = 0
            end,
        },

        {
            "yioneko/nvim-cmp",
            branch = "perf",
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
                    commit = "937667b2cadc7905e6b9ba18ecf84694cf227567",
                    opts = {
                        -- enable_chat = true,
                    },
                },
            },
        },
        {
            "williamboman/mason-lspconfig.nvim",
            dependencies = {
                {
                    "williamboman/mason.nvim",
                    config = true,
                },
            },
        },
        {
            "echasnovski/mini.pairs",
        },
        {
            "hedyhli/outline.nvim",
            enabled = false,
            cmd = { "Outline" },
            keys = {
                { "<f7>", "<cmd>Outline<CR>", desc = "Toggle Outline" },
            },
            opts = {},
        },
        {
            "olrtg/nvim-emmet",
            enabled = false,
            config = function()
                vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
            end,
        },
    },
    keys = {
        { "<leader>li", "<cmd>LspInfo<cr>" },
        { mode = { "n", "v" }, "<space>ca", vim.lsp.buf.code_action },
        { "<leader>ff", "<cmd>LspZeroFormat<cr>" },
        {
            "<leader>rn",
            "<cmd>lua vim.lsp.buf.rename()<cr>",
        },
    },

    init = function()
        local keys = {
            ["cr"] = vim.api.nvim_replace_termcodes("<CR>", true, true, true),
            ["ctrl-y"] = vim.api.nvim_replace_termcodes("<C-y>", true, true, true),
            ["ctrl-y_cr"] = vim.api.nvim_replace_termcodes("<C-y><CR>", true, true, true),
        }

        vim.diagnostic.config({
            virtual_text = false,
        })

        _G.cr_action = function()
            if vim.fn.pumvisible() ~= 0 then
                local item_selected = vim.fn.complete_info()["selected"] ~= -1
                return item_selected and keys["ctrl-y"] or keys["ctrl-y_cr"]
            else
                return require("mini.pairs").cr()
                -- return keys['cr']
            end
        end
    end,
    config = function()
        require("mini.pairs").setup()

        local lspconfig = require("lspconfig")
        -- This is where all the LSP shenanigans will live
        local lsp_zero = require("lsp-zero")
        -- lsp_zero.extend_lspconfig()
        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })

            if client.server_capabilities["documentSymbolProvider"] then
                local statusNavic, Navic = pcall(require, "nvim-navic")
                if statusNavic then
                    Navic.attach(client, bufnr)
                end
            end
            -- lsp_zero.buffer_autoformat()
        end)
        lsp_zero.set_sign_icons({
            error = "",
            warn = "",
            hint = "",
            info = "",
        })

        -- auto install lsp
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                -- "emmet_language_server",
                -- "intelephense",
                "tailwindcss",
                -- "jsonls",
                -- "ruff_lsp"
            },
            handlers = {
                lsp_zero.default_setup,
                ["lua_ls"] = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    lspconfig.lua_ls.setup(lua_opts)
                end,
                ["emmet_language_server"] = function()
                    lspconfig.emmet_language_server.setup({
                        filetypes = {
                            "css",
                            "eruby",
                            "html",
                            "javascript",
                            "javascriptreact",
                            "less",
                            "sass",
                            "scss",
                            "pug",
                            "typescriptreact",
                            "blade",
                            "vue",
                        },
                    })
                end,
            },
        })

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
