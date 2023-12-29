-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = map  -- set global keymap
local g = vim.g -- global variables
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }


-- coc multiple cursor
vim.api.nvim_set_keymap('n', "<C-c>", "<Plug>(coc-cursors-position)", default_opts)
vim.api.nvim_set_keymap('n', "<C-d>", "<Plug>(coc-cursors-word)", default_opts)
vim.api.nvim_set_keymap('x', "<C-d>", "<Plug>(coc-cursors-range)", default_opts)
vim.api.nvim_set_keymap('n', "<leader>x", "<Plug>(coc-cursors-operator)", default_opts)


-- coc-explorer
vim.api.nvim_set_keymap("n", "<C-n>", ":CocCommand explorer<CR>", default_opts) -- open/close


vim.api.nvim_set_keymap("n", "<leader>.", "<Plug>(coc-codeaction)", {})
vim.api.nvim_set_keymap("n", "<leader>l", ":CocCommand eslint.executeAutofix<CR>", {})
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", { silent = true })
vim.api.nvim_set_keymap("n", "K", ":call CocActionAsync('doHover')<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>rn", "<Plug>(coc-rename)", {})


-- snippets
-- map("i", "<leader>s", "<Plug>(coc-snippets-expand)", default_opts)
vim.api.nvim_set_keymap("x", "<leader>x", "<Plug>(coc-convert-snippet)", default_opts)

-- vim.api.nvim_set_keymap("v", "<leader>ss", "<Plug>(coc-snippets-select)", default_opts)

-- formater command
vim.api.nvim_set_keymap("n", "<leader>f", ":call CocActionAsync('format')<CR>", { noremap = true })
vim.api.nvim_set_keymap("x", "<leader>f", " <Plug>(coc-format-selected)<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>f", " <Plug>(coc-format-selected)<CR>", { noremap = true })



-- show list in fzf
vim.api.nvim_set_keymap("n", "<leader>coc", ":CocList<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>P", ":CocList commands<CR>", { noremap = true })


vim.api.nvim_set_keymap("i", "<C-space>", "coc#refresh()", { silent = true, expr = true })

vim.api.nvim_set_keymap("i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : '<TAB>'",
    { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<S-TAB>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-h>'",
    { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-j>", "coc#pum#visible() ? coc#pum#next(1) : '<C-j>'",
    { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-k>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-k>'",
    { noremap = true, silent = true, expr = true })


vim.api.nvim_set_keymap("i", "<down>", "coc#pum#visible() ? coc#pum#next(1) : '<down>'",
    { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<up>", "coc#pum#visible() ? coc#pum#prev(1) : '<up>'",
    { noremap = true, silent = true, expr = true })


vim.api.nvim_set_keymap("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'",
    { silent = true, expr = true, noremap = true })



g.coc_global_extensions = { 'coc-json', 'coc-marketplace', 'coc-explorer', 'coc-snippets', 'coc-lua', 'coc-prettier',
    'coc-pairs' }

return {
    'neoclide/coc.nvim',
    branch = 'release',
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    }
}
