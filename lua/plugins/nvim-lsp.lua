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

        -- { 'hrsh7th/cmp-nvim-lsp' },
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
        }
    },
    keys         = {
        { "<leader>li",        "<cmd>LspInfo<cr>" },
        { "<leader>fm",        "<cmd>lua vim.lsp.buf.format({async = true})<cr>", noremap = true,                           silent = true, desc = 'Format Buffer' },
        { mode = { "n", "v" }, "<space>ca",                                       vim.lsp.buf.code_action },

        -- mini completion
        { mode = 'i',          '<CR>',                                            'v:lua._G.cr_action()',                   expr = true },
        { mode = 'i',          '<Tab>',                                           [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   expr = true },
        { mode = 'i',          '<S-Tab>',                                         [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], expr = true },
        { mode = 'i',          '<C-j>',                                           [[pumvisible() ? "\<C-n>" : "\<C-j>"]],   expr = true },
        { mode = 'i',          '<C-k>',                                           [[pumvisible() ? "\<C-p>" : "\<C-k>"]],   expr = true },
    },

    init         = function()
        local keys = {
            ['cr']        = vim.api.nvim_replace_termcodes('<CR>', true, true, true),
            ['ctrl-y']    = vim.api.nvim_replace_termcodes('<C-y>', true, true, true),
            ['ctrl-y_cr'] = vim.api.nvim_replace_termcodes('<C-y><CR>', true, true, true),
        }

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
        require('mini.completion').setup({
            window = {
                info = { border = 'rounded' },
                signature = { border = 'rounded' },
            },
        })

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
    end
}
