return {
    'neovim/nvim-lspconfig',
    cmd          = { 'LspInfo', 'LspInstall', 'LspStart' },
    event        = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
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
                    end
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
                "onsails/lspkind.nvim"
            },
        },
        {
            'williamboman/mason-lspconfig.nvim',
            dependencies = {
                {
                    'williamboman/mason.nvim',
                    lazy = false,
                    config = true,
                },
            }
        },
        {
            "echasnovski/mini.nvim",
        },
        {
            'stevearc/aerial.nvim',
            opts = {},
            cmd = { 'AerialToggle' },
            keys = { -- Example mapping to toggle outline
                { "<f7>", "<cmd>AerialToggle<CR>", desc = "Toggle outline" },
            },
            -- Optional dependencies
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "nvim-tree/nvim-web-devicons"
            },
        },
        {
            "hedyhli/outline.nvim",
            keys = {
                { "<f7>", "<cmd>Outline<CR>", desc = "Toggle Outline" }
            },
            opts = {},
        },
        {
            "nvimtools/none-ls.nvim",
            dependencies = {
            },
            config = function()
                null_ls = require("null-ls")
                local formatting = null_ls.builtins.formatting
                local diagnostics = null_ls.builtins.diagnostics
                local completion = null_ls.builtins.completion
                local hover = null_ls.builtins.hover

                null_ls.setup({
                    cache = false,
                    debug = false,
                    temp_dir = "/tmp",
                    -- on_attach = require("lsp.handlers").on_attach,
                    sources = {
                        completion.tags,
                        formatting.prettier,
                        -- formatting.prettierd,
                        -- formatting.prettier_d_slim,
                        -- formatting.black.with({ extra_args = { "--fast" } }),

                        -- formatting.stylua,
                        -- formatting.google_java_format,

                        -- python {{{
                        -- diagnostics.flake8,
                        -- formatting.reorder_python_imports,
                        formatting.autoflake,
                        formatting.autopep8,
                        formatting.blue,
                        -- }}}
                        --
                        formatting.phpcsfixer.with({
                            extra_args = { "--config", "/home/deve/.config/nvim/configs/php-cs-fixer.php" }
                        }),
                        -- formatting.phpcbf,
                        formatting.blade_formatter,
                        formatting.fixjson,
                        hover.dictionary,

                        diagnostics.fish
                    },
                })
            end
        }


    },
    keys         = {
        { "<leader>li",        "<cmd>LspInfo<cr>" },
        { "<leader>fm",        "<cmd>lua vim.lsp.buf.format({async = true})<cr>", noremap = true,         silent = true, desc = 'Format Buffer' },
        { mode = { "n", "v" }, "<space>ca",                                       vim.lsp.buf.code_action },
    },

    init         = function()
        local keys = {
            ['cr']        = vim.api.nvim_replace_termcodes('<CR>', true, true, true),
            ['ctrl-y']    = vim.api.nvim_replace_termcodes('<C-y>', true, true, true),
            ['ctrl-y_cr'] = vim.api.nvim_replace_termcodes('<C-y><CR>', true, true, true),
        }



        vim.diagnostic.config({
            virtual_text = false,
        })

        _G.cr_action = function()
            if vim.fn.pumvisible() ~= 0 then
                local item_selected = vim.fn.complete_info()['selected'] ~= -1
                return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
            else
                return require('mini.pairs').cr()
                -- return keys['cr']
            end
        end
    end,
    config       = function()
        require('mini.pairs').setup()


        -- This is where all the LSP shenanigans will live
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_lspconfig()
        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({ buffer = bufnr })
            lsp_zero.buffer_autoformat()
        end)
        lsp_zero.set_sign_icons({
            error = "",
            warn = "",
            hint = "",
            info = ""
        })

        require('mason-lspconfig').setup({
            ensure_installed = { 'lua_ls' },
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    require('lspconfig').lua_ls.setup(lua_opts)
                end,
            }
        })


        -- completion plugin setup
        local cmp = require('cmp')
        local lspkind = require("lspkind")
        cmp.setup({
            view = {
                entries = "custom",
            },
            snippet = {
                expand = function(args)
                    -- vim.fn["vsnip#anonymous"](args.body)
                    require 'luasnip'.lsp_expand(args.body)
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

                format = lspkind.cmp_format()
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                -- { name = 'vsnip' },
                { name = 'luasnip' },

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
                    require "cmp-under-comparator".under,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
            -- experimental = { ghost_text = false },
        })
    end
}
