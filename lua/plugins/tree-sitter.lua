local variables = require("variables")

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
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
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            parser_config.blade = {
                install_info = {
                    url = "https://github.com/EmranMR/tree-sitter-blade",
                    files = { "src/parser.c" },
                    branch = "main",
                },
                filetype = "blade",
            }

            local bladeGrp = vim.api.nvim_create_augroup("BladeFiltypeRelated", { clear = true })
            vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
                pattern = "*.blade.php",
                group = bladeGrp,
                callback = function()
                    vim.opt.filetype = "blade"
                end,
            })
            vim.filetype.add({
                pattern = {
                    [".*%.blade%.php"] = "blade",
                },
            })

            require("nvim-treesitter.configs").setup({
                -- A list of parser names, or "all"
                ensure_installed = variables.filetypes,
                sync_install = false,
                ignore_install = {},
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true,
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
                indent = { enable = true, disable = { "pug", "vue" } },
            })
        end,
    },
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        keys = {
            { "<Leader>nf", ":lua require('neogen').generate()<CR>", noremap = true, silent = true },
        },
        opts = {},
    },
    -- {
    --     "HiPhish/rainbow-delimiters.nvim",
    --     dependencies = "nvim-treesitter/nvim-treesitter",
    --     event = "BufEnter",
    -- }
}
