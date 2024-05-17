return {
    {
        "stevearc/conform.nvim",
        enabled = true,
        -- lazy = "VeryLazy",
        event = { "BufWritePre" },
        dependencies = {
            {
                "williamboman/mason.nvim",
                lazy = false,
            },
            {
                "zapling/mason-conform.nvim",
                opts = {},
                dependencies = {
                    {
                        "williamboman/mason.nvim",
                        lazy = false,
                    },
                },
            },
        },
        keys = {
            {
                "<leader>fm",
                "<cmd>lua require('conform').format({lsp_fallback = true})<cr>",
                noremap = true,
                silent = true,
                desc = "Format Buffer",
            },
        },

        config = function()
            -- start of formatter {{{
            local util = require("conform.util")

            require("conform").setup({
                format_after_save = function(bufnr)
                    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                        return
                    end
                    -- ...additional logic...
                    return { lsp_fallback = true }
                end,
                formatters_by_ft = {
                    ["*"] = { "trim_whitespace", "trim_newlines" },
                    lua = { "stylua" },
                    python = { "blue", "ruff_fix", "ruff_format" },
                    php = { "php_cs_fixer" },
                    blade = { "blade-formatter" },
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    json = { "prettier" },
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
    },
}
