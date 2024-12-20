return {
    "jay-babu/mason-null-ls.nvim",
    enabled = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
        -- {
        --     "garymjr/nvim-snippets",
        -- },
    },

    keys = {
        {
            "<leader>fm",
            "<cmd>lua vim.lsp.buf.format({async = true})<cr>",
            noremap = true,
            silent = true,
            desc = "Format Buffer",
        },
    },

    config = function()
        require("mason-null-ls").setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "phpcsfixer",
                "blade-formatter",
            },
            automatic_installation = false,
            handlers = {},
        })

        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local completion = null_ls.builtins.completion
        local hover = null_ls.builtins.hover

        -- require("snippets").setup({
        --     create_autocmd = true,
        --     create_cmp_source = false,
        --     friendly_snippets = true,
        -- })

        null_ls.setup({
            cache = false,
            debug = false,
            temp_dir = "/tmp",
            -- on_attach = require("lsp.handlers").on_attach,
            sources = {
                completion.tags,
                -- completion.spell,
                -- completion.nvim_snippets,
                formatting.phpcsfixer.with({
                    extra_args = { "--config", "/home/deve/.config/nvim/configs/php-cs-fixer.php" },
                }),
                formatting.prettier.with({
                    extra_filetypes = { "toml" },
                }),
                diagnostics.fish,
                hover.dictionary,
            },

            -- on_attach = function(client, bufnr)
            -- Auto Format On Save
            -- if client.supports_method("textDocument/formatting") then
            --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            --     vim.api.nvim_create_autocmd("BufWritePre", {
            --         group = augroup,
            --         buffer = bufnr,
            --         callback = function()
            --             vim.lsp.buf.format({ bufnr = bufnr, async = true })
            --         end,
            --     })
            -- end
            -- end,
        })
    end,
}
