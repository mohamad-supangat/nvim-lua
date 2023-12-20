return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "HiPhish/rainbow-delimiters.nvim",
            "windwp/nvim-ts-autotag",
            {
                "JoosepAlviste/nvim-ts-context-commentstring",
                opts = {
                    enable_autocmd = false,
                },
            },

            -- "andersevenrud/nvim_context_vt",
            -- "windwp/nvim-autopairs",
            -- "nvim-treesitter/nvim-treesitter-context",
        },
        config = function()
            local status_ok, configs = pcall(require, "nvim-treesitter.configs")
            local variables = require("variables")

            local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
            parser_config.blade = {
                install_info = {
                    url = "https://github.com/EmranMR/tree-sitter-blade",
                    files = { "src/parser.c" },
                    branch = "main",
                },
                filetype = "blade"
            }

            local bladeGrp = vim.api.nvim_create_augroup("BladeFiltypeRelated", { clear = true })
            vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
                pattern = "*.blade.php",
                group = bladeGrp,
                callback = function()
                    vim.opt.filetype = "blade"
                end,

            })
            configs.setup({
                -- A list of parser names, or "all"
                ensure_installed = variables.filetypes,
                sync_install = false,
                ignore_install = {},
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                -- autopairs = { enable = true },
                autotag = {
                    enable = true,
                    filetypes = {
                        "html",
                        "javascript",
                        "typescript",
                        "javascriptreact",
                        "typescriptreact",
                        "svelte",
                        "vue",
                        "tsx",
                        "jsx",
                        "rescript",
                        "xml",
                        "php",
                        "markdown",
                        "glimmer",
                        "handlebars",
                        "hbs",
                        "blade",
                    },
                },
                indent = { enable = true, disable = {} },
            })
            --
            -- require("treesitter-context").setup({
            --     enable = true,
            -- })


            local rainbow_delimiters = require 'rainbow-delimiters'
            vim.g.rainbow_delimiters = {
                strategy = {
                    [''] = rainbow_delimiters.strategy['global'],
                    commonlisp = rainbow_delimiters.strategy['local'],
                },
                query = {
                    [''] = 'rainbow-delimiters',
                    lua = 'rainbow-blocks',
                },
                highlight = {
                    'RainbowDelimiterRed',
                    'RainbowDelimiterYellow',
                    'RainbowDelimiterBlue',
                    'RainbowDelimiterOrange',
                    'RainbowDelimiterGreen',
                    'RainbowDelimiterViolet',
                    'RainbowDelimiterCyan',
                },
                blacklist = { 'c', 'cpp' },
            }

            -- require('nvim_context_vt').setup()
        end
    },
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            require('neogen').setup({})
            vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>",
                { noremap = true, silent = true })
        end
    }
}
