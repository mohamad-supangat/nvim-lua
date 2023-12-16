local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local hover = null_ls.builtins.hover

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

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
        -- formatting.black.with({ extra_args = { "--fast" } }),
        -- formatting.reorder_python_imports,
        -- formatting.stylua,
        -- formatting.google_java_format,
        formatting.phpcsfixer,
        -- formatting.phpcbf,
        formatting.blade_formatter,
        formatting.fixjson,
        -- diagnostics.flake8,
        -- diagnostics.pydocstyle,
        -- diagnostics.selene,
        completion.tags,
        -- completion.vsnip,
        hover.dictionary
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.keymap.set("n", "<Leader>f", function()
                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, { buffer = bufnr, desc = "[lsp] format" })

            -- format on save
            vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
            vim.api.nvim_create_autocmd(event, {
                buffer = bufnr,
                group = group,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr, async = async })
                end,
                desc = "[lsp] format on save",
            })
        end

        if client.supports_method("textDocument/rangeFormatting") then
            vim.keymap.set("x", "<Leader>f", function()
                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, { buffer = bufnr, desc = "[lsp] format" })
        end
    end,
})
