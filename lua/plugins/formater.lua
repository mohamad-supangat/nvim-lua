return {
    "stevearc/conform.nvim",
    lazy = "VeryLazy",
    dependencies = {
        {
            "zapling/mason-conform.nvim",
            lazy = "VeryLazy",
            opts = {},
        },
        {
            "williamboman/mason.nvim",
            lazy = false,
            config = true,
        },
    },
    keys = {
        {
            "<leader>fm",
            "<cmd>lua require('conform').format()<cr>",
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
                lua = { "stylua" },
                python = { "ruff" },
                php = { "php_cs_fixer" },
                blade = { "blade-formatter" },
                javascript = { "prettier" },
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
