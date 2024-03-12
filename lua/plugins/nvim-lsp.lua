return {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
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
            "hrsh7th/nvim-cmp",
            dependencies = {
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                {
                    "L3MON4D3/LuaSnip",
                    config = function()
                        require("luasnip.loaders.from_vscode").lazy_load()
                    end,
                },
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-nvim-lua",
                -- "hrsh7th/vim-vsnip"
                -- "hrsh7th/cmp-vsnip",
                -- "hrsh7th/cmp-cmdline",
                -- "jcha0713/cmp-tw2css",
                "hrsh7th/cmp-nvim-lsp-signature-help",
                "lukas-reineke/cmp-under-comparator",
                "onsails/lspkind.nvim",
                -- {
                --     "Exafunction/codeium.nvim",
                --     opts = {}
                -- }
            },
        },
        {
            "williamboman/mason-lspconfig.nvim",
            dependencies = {
                {
                    "williamboman/mason.nvim",
                    lazy = false,
                    config = true,
                },
            },
        },
        {
            "echasnovski/mini.nvim",
        },
        {
            "hedyhli/outline.nvim",
            cmd = { "Outline" },
            keys = {
                { "<f7>", "<cmd>Outline<CR>", desc = "Toggle Outline" },
            },
            opts = {},
        },
        {
            "olrtg/nvim-emmet",
            config = function()
                vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
            end,
        },
        {
            "stevearc/conform.nvim",
            lazy = "VeryLazy",
        },
        {
            "zapling/mason-conform.nvim",
            lazy = "VeryLazy",
            opts = {},
        },
    },
    keys = {
        { "<leader>li", "<cmd>LspInfo<cr>" },
        {
            "<leader>fm",
            "<cmd>lua require('conform').format()<cr>",
            noremap = true,
            silent = true,
            desc = "Format Buffer",
        },
        { mode = { "n", "v" }, "<space>ca", vim.lsp.buf.code_action },
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
        lsp_zero.extend_lspconfig()
        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)
        lsp_zero.set_sign_icons({
            error = "",
            warn = "",
            hint = "",
            info = "",
        })

        -- auto install lsp
        require("mason-lspconfig").setup({
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
                        },
                    })
                end,
            },
        })

        -- start of formatter {{{
        local util = require("conform.util")

        require("conform").setup({
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff" },
                php = { "php_cs_fixer" },
                blade = { "blade-formatter" },
                javascript = { "prettier" },
            },

            formatters = {
                php_cs_fixer = {
                    command = "php-cs-fixer",
                    args = { "fix", "$FILENAME", "--config", "/home/deve/.config/nvim/configs/php-cs-fixer.php" },
                    stdin = false,
                    cwd = util.root_file({ "composer.json" }),
                },
            },
        })

        -- }}} end for formmater config

        -- completion plugin setup
        local cmp = require("cmp")
        local lspkind = require("lspkind")
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
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                }),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol",
                    maxwidth = 50,
                    ellipsis_char = "...",
                    symbol_map = { Codeium = "" },
                }),
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                -- { name = 'vsnip' },
                { name = "luasnip" },
                -- { name = "codeium" },
                {
                    name = "buffer",
                    option = {
                        get_bufnrs = function()
                            return vim.api.nvim_list_bufs()
                        end,
                    },
                },
                -- { name = "nvim_lsp_signature_help" },
                { name = "path" },
                -- { name = "cmp-tw2css" },
            },
            confirm_opts = { behavior = cmp.ConfirmBehavior.Replace, select = false },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sorting = {
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    require("cmp-under-comparator").under,
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
