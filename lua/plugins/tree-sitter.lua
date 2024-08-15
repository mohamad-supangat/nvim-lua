local variables = require("variables")

return {
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = false,
        opts = {
            enable_autocmd = false,
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        dependencies = {
            -- "andersevenrud/nvim_context_vt",
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
    {
        "windwp/nvim-ts-autotag",
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true,
                    enable_rename = true,
                    enable_close_on_slash = false,
                },
                aliases = {
                    ["blade"] = "html",
                },
            })
        end,
    },

    -- {
    --     "HiPhish/rainbow-delimiters.nvim",
    --     dependencies = "nvim-treesitter/nvim-treesitter",
    --     enabled = false,
    --     event = "BufEnter",
    --     config = function()
    --         local rainbow_delimiters = require("rainbow-delimiters")
    --
    --         vim.g.rainbow_delimiters = {
    --             strategy = {
    --                 [""] = rainbow_delimiters.strategy["global"],
    --                 vim = rainbow_delimiters.strategy["local"],
    --             },
    --             query = {
    --                 [""] = "rainbow-delimiters",
    --                 lua = "rainbow-blocks",
    --             },
    --             priority = {
    --                 [""] = 110,
    --                 lua = 210,
    --             },
    --             highlight = {
    --                 "RainbowDelimiterRed",
    --                 "RainbowDelimiterYellow",
    --                 "RainbowDelimiterBlue",
    --                 "RainbowDelimiterOrange",
    --                 "RainbowDelimiterGreen",
    --                 "RainbowDelimiterViolet",
    --                 "RainbowDelimiterCyan",
    --             },
    --         }
    --     end,
    -- },
}
