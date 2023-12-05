local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

local status_ok, neogen = pcall(require, "neogen")
if not status_ok then
    return
end

neogen.setup({})
map("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", default_opts)
