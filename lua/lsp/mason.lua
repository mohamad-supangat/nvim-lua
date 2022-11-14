local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

--  ╭──────────────────────────────────────────────────────────╮
--  │ mason lsp config helper                                  │
--  ╰──────────────────────────────────────────────────────────╯
local lsp_status_ok, mason_lsp = pcall(require, "mason-lspconfig")
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")

if not lsp_status_ok then
	return
end
mason_lsp.setup({ ensure_installed = { "sumneko_lua" } })

mason_lsp.setup_handlers({
	function(server) -- default handler (optional)
		opts = {
			on_attach = require("lsp.handlers").on_attach,
			capabilities = require("lsp.handlers").capabilities,
		}

		if server == "sumneko_lua" then
			local sumneko_opts = require("lsp.settings.sumneko_lua")
			opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
		end

		if server == "pyright" then
			local pyright_opts = require("lsp.settings.pyright")
			opts = vim.tbl_deep_extend("force", pyright_opts, opts)
		end

		lspconfig[server].setup(opts)
	end,
})
