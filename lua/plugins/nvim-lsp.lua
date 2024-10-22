return {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    enabled = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v3.x",
            lazy = true,
            config = false,
            init = function()
                -- Disable automatic setup, we are doing it manually
                vim.g.lsp_zero_extend_cmp = 0
                vim.g.lsp_zero_extend_lspconfig = 0
            end,
        },

        {
            "williamboman/mason-lspconfig.nvim",
            dependencies = {
                {
                    "williamboman/mason.nvim",
                    config = true,
                },
            },
        },
        {
            "echasnovski/mini.pairs",
        },
        {
            "olrtg/nvim-emmet",
            enabled = false,
            config = function()
                vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
            end,
        },
    },
    keys = {
        { "<leader>li", "<cmd>LspInfo<cr>" },
        { mode = { "n", "v" }, "<space>ca", vim.lsp.buf.code_action },
        { "<leader>ff", "<cmd>LspZeroFormat<cr>" },
        {
            "<leader>rn",
            "<cmd>lua vim.lsp.buf.rename()<cr>",
        },
    },

    init = function()
        local keys = {
            ["cr"] = vim.api.nvim_replace_termcodes("<CR>", true, true, true),
            ["ctrl-y"] = vim.api.nvim_replace_termcodes("<C-y>", true, true, true),
            ["ctrl-y_cr"] = vim.api.nvim_replace_termcodes("<C-y><CR>", true, true, true),
        }

        vim.diagnostic.config({
            virtual_text = false,
        })

        _G.cr_action = function()
            if vim.fn.pumvisible() ~= 0 then
                local item_selected = vim.fn.complete_info()["selected"] ~= -1
                return item_selected and keys["ctrl-y"] or keys["ctrl-y_cr"]
            else
                return require("mini.pairs").cr()
                -- return keys['cr']
            end
        end
    end,
    config = function()
        require("mini.pairs").setup()

        local lspconfig = require("lspconfig")
        -- This is where all the LSP shenanigans will live
        local lsp_zero = require("lsp-zero")
        -- lsp_zero.extend_lspconfig()
        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })

            if client.server_capabilities["documentSymbolProvider"] then
                local statusNavic, Navic = pcall(require, "nvim-navic")
                if statusNavic then
                    Navic.attach(client, bufnr)
                end
            end
            -- lsp_zero.buffer_autoformat()
        end)
        lsp_zero.set_sign_icons({
            error = "",
            warn = "",
            hint = "",
            info = "",
        })

        -- auto install lsp
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                -- "emmet_language_server",
                -- "intelephense",
                "tailwindcss",
                -- "jsonls",
                -- "ruff_lsp"
            },
            handlers = {
                lsp_zero.default_setup,
                ["lua_ls"] = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    lspconfig.lua_ls.setup(lua_opts)
                end,
                ["emmet_language_server"] = function()
                    lspconfig.emmet_language_server.setup({
                        filetypes = {
                            "css",
                            "eruby",
                            "html",
                            "javascript",
                            "javascriptreact",
                            "less",
                            "sass",
                            "scss",
                            "pug",
                            "typescriptreact",
                            "blade",
                            "vue",
                            "php"
                        },
                    })
                end,
            },
        })
    end,
}
