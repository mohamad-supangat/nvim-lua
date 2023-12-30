-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = map  -- set global keymap
local g = vim.g -- global variables
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }


-- coc multiple cursor
map('n', "<C-c>", "<Plug>(coc-cursors-position)", default_opts)
map('n', "<C-d>", "<Plug>(coc-cursors-word)", default_opts)
map('x', "<C-d>", "<Plug>(coc-cursors-range)", default_opts)
map('n', "<leader>x", "<Plug>(coc-cursors-operator)", default_opts)


-- coc-explorer
map("n", "<C-n>", ":CocCommand explorer<CR>", default_opts) -- open/close


map("n", "<leader>.", "<Plug>(coc-codeaction)", {})
map("n", "<leader>l", ":CocCommand eslint.executeAutofix<CR>", {})
map("n", "gd", "<Plug>(coc-definition)", { silent = true })
map("n", "K", ":call CocActionAsync('doHover')<CR>", { silent = true, noremap = true })
map("n", "<leader>rn", "<Plug>(coc-rename)", {})


-- snippets
-- map("i", "<leader>s", "<Plug>(coc-snippets-expand)", default_opts)
map("x", "<leader>x", "<Plug>(coc-convert-snippet)", default_opts)

-- map("v", "<leader>ss", "<Plug>(coc-snippets-select)", default_opts)

-- formater command
map("n", "<leader>f", ":call CocActionAsync('format')<CR>", { noremap = true })
map("x", "<leader>f", " <Plug>(coc-format-selected)<CR>", { noremap = true })
map("v", "<leader>f", " <Plug>(coc-format-selected)<CR>", { noremap = true })


-- diagnostic

map("n", "[g", "<Plug>(coc-diagnostic-prev)", { noremap = true })
map("n", "]g", "<Plug>(coc-diagnostic-next)", { noremap = true })
map("n", "<leader>xx", ":CocList diagnostic", { noremap = true })
map("n", "gl", ":call CocActionAsync('diagnosticInfo')<CR>", default_opts)







-- show list in fzf
map("n", "<leader>coc", ":CocList<CR>", { noremap = true })
map("n", "<leader>P", ":CocList commands<CR>", { noremap = true })


map("i", "<C-space>", "coc#refresh()", { silent = true, expr = true })

map("i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : '<TAB>'",
    { noremap = true, silent = true, expr = true })
map("i", "<S-TAB>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-h>'",
    { noremap = true, silent = true, expr = true })
map("i", "<C-j>", "coc#pum#visible() ? coc#pum#next(1) : '<C-j>'",
    { noremap = true, silent = true, expr = true })
map("i", "<C-k>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-k>'",
    { noremap = true, silent = true, expr = true })


map("i", "<down>", "coc#pum#visible() ? coc#pum#next(1) : '<down>'",
    { noremap = true, silent = true, expr = true })
map("i", "<up>", "coc#pum#visible() ? coc#pum#prev(1) : '<up>'",
    { noremap = true, silent = true, expr = true })


map("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'",
    { silent = true, expr = true, noremap = true })



g.coc_global_extensions = { 'coc-json', 'coc-marketplace', 'coc-explorer', 'coc-snippets', 'coc-lua', 'coc-prettier',
    'coc-pairs', 'coc-emmet' }

return {
    'neoclide/coc.nvim',
    branch = 'release',
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    }
}
