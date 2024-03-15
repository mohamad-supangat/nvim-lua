return {
    "stevearc/conform.nvim",
    -- lazy = "VeryLazy",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "williamboman/mason.nvim",
            lazy = false,
        },
        {
            "zapling/mason-conform.nvim",
            opts = {},
        },
    },
    keys = {
        {
            "<leader>fm",
            "<cmd>lua require('conform').format({lsp_fallback = 'always'})<cr>",
            noremap = true,
            silent = true,
            desc = "Format Buffer",
        },
    },

    config = function()
        -- start of formatter {{{
        local util = require("conform.util")

        require("conform").setup({
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
            formatters_by_ft = {
                ["*"] = { "trim_whitespace", "trim_newlines" },
                lua = { "stylua" },
                python = { "blue", "ruff_fix", "ruff_format" },
                php = { "phpcbf", "php_cs_fixer" },
                blade = { "blade-formatter" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                vue = { "prettier" },
                html = { "prettier" },
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
    end,
}
