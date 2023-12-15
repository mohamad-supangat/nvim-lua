local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("lsp.mason")
require("lsp.handlers").setup()
require("lsp.trouble")

local keymap = vim.keymap.set

keymap("n", "gl", vim.diagnostic.open_float)
keymap("n", "[g", vim.diagnostic.goto_prev)
keymap("n", "]g", vim.diagnostic.goto_next)
keymap("n", "<space>lq", vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        keymap("n", "gD", vim.lsp.buf.declaration, opts)
        keymap("n", "gd", vim.lsp.buf.definition, opts)
        keymap("n", "<space>D", vim.lsp.buf.type_definition, opts)
        keymap("n", "gr", vim.lsp.buf.references, opts)
        keymap("n", "K", vim.lsp.buf.hover, opts)
        keymap("n", "gi", vim.lsp.buf.implementation, opts)

        -- keymap("n", "<C-K>", vim.lsp.buf.signature_help, opts)

        keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
        keymap("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)

        keymap("n", "<space>rn", vim.lsp.buf.rename, opts)
        keymap({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)

        keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)

        -- quickfix implementation
        keymap("n", "<leader>qf", "<cmd>lua vim.lsp.buf.code_action({apply=true})<cr>", opts)

        keymap("n", "<space>fm", function()
            vim.lsp.buf.format({ async = true })
        end, opts)
    end,
})
