local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then return end

local servers = {
    "sumneko_lua", "cssls", "html", "tsserver", "pyright", "bashls", "jsonls",
    "yamlls"
}

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("lsp.handlers").on_attach,
        capabilities = require("lsp.handlers").capabilities
    }

    if server == "sumneko_lua" then
        local sumneko_opts = require "lsp.settings.sumneko_lua"
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server == "pyright" then
        local pyright_opts = require "lsp.settings.pyright"
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    lspconfig[server].setup(opts)
end