local variables = require("variables")

return {
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            enable_autocmd = false,
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        enabled = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
            max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
            min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
            line_numbers = true,
            multiline_threshold = 20, -- Maximum number of lines to show for a single context
            trim_scope = "outer",     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            mode = "cursor",          -- Line used to calculate context. Choices: 'cursor', 'topline'
            -- Separator between context and content. Should be a single character string, like '-'.
            -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
            separator = "━",
            zindex = 20,     -- The Z-index of the context window
            on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
        },
    },
    {
        "andersevenrud/nvim_context_vt",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            enabled = false,
            prefix = "",
            disable_ft = { "markdown" },
            disable_virtual_lines = false,
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        dependencies = {},
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
                indent = { enable = false, disable = { "pug", "vue" } },
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
