return {
    "creativenull/efmls-configs-nvim",
    enabled = false,
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
        local fs = require('efmls-configs.fs')

        -- Register linters and formatters per language
        -- local eslint = require('efmls-configs.linters.eslint')
        local prettier = require("efmls-configs.formatters.prettier")
        local stylua = require("efmls-configs.formatters.stylua")
        local languages = require("efmls-configs.defaults").languages()


        languages = vim.tbl_extend("force", languages, {
            -- Custom languages, or override existing ones
            --
            -- php = {
            -- require('efmls-configs.formatters.php_cs_fixer'),
            -- require('efmls-configs.formatters.pint')
            -- },
            --
            --
            php = {
                {
                    formatCommand = string.format('%s %s', fs.executable('php-cs-fixer', fs.Scope.COMPOSER),
                        "fix --no-ansi --using-cache=no --quiet '${INPUT}'"),
                    formatStdin = false,
                }
            },

            blade = { require("efmls-configs.formatters.blade_formatter") },
            html = { prettier },
            typescript = { prettier },
            javascript = { prettier },
            vue = { prettier },
            json = { prettier, require("efmls-configs.formatters.fixjson") },
            jsonc = { prettier },
            lua = {},
        })

        local efmls_config = {
            filetypes = vim.tbl_keys(languages),
            settings = {
                rootMarkers = { ".git/" },
                languages = languages,
            },
            init_options = {
                documentFormatting = true,
                documentRangeFormatting = true,
            },
        }

        require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {
            -- Pass your custom lsp config below like on_attach and capabilities
            --
            -- on_attach = require("lsp.handlers").on_attach,
            -- capabilities = require("lsp.handlers").capabilities,
        }))

        --
        -- local lsp_fmt_group = vim.api.nvim_create_augroup('LspFormattingGroup', {})
        -- vim.api.nvim_create_autocmd('BufWritePost', {
        --     group = lsp_fmt_group,
        --     callback = function(ev)
        --         local efm = vim.lsp.get_active_clients({ name = 'efm', bufnr = ev.buf })
        --
        --         if vim.tbl_isempty(efm) then
        --             return
        --         end
        --
        --         vim.lsp.buf.format({ name = 'efm' })
        --     end,
        -- })
    end,
}
