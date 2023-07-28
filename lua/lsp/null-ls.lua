local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup({
	cache = false,
	debug = false,
	temp_dir = "/tmp",
	-- on_attach = require("lsp.handlers").on_attach,
	sources = {
		formatting.prettier,
		-- formatting.prettierd,
		-- formatting.prettier_d_slim,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.reorder_python_imports,
		formatting.stylua,
		-- formatting.google_java_format,
		-- formatting.phpcbf,
		formatting.phpcsfixer,
		formatting.blade_formatter,
		formatting.fixjson,
		diagnostics.flake8,
		diagnostics.pydocstyle,
		diagnostics.selene,
		completion.tags,
	},
})
