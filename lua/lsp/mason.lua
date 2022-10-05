local status_ok, mason = pcall(require, "mason")
if not status_ok then return end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

--  ╭──────────────────────────────────────────────────────────╮
--  │ mason lsp config helper                                  │
--  ╰──────────────────────────────────────────────────────────╯
local lsp_status_ok, mason_lsp = pcall(require, "mason-lspconfig")
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")

if not lsp_status_ok then return end
mason_lsp.setup({
    ensure_installed = { 'sumneko_lua' },
})


mason_lsp.setup_handlers({
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    ["sumneko_lua"] = function()
        lspconfig.sumneko_lua.setup(require('lsp.settings.sumneko_lua'))
    end,

    ["pyright"] = function()
        lspconfig.pyright.setup(require('lsp.settings.pyright'))
    end,
})
