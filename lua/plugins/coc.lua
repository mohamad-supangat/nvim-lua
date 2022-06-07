
-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = map  -- set global keymap
local cmd = vim.cmd -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local fn = vim.fn -- call Vim functions
local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options
local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}


-- coc multiple cursor
map('n', "<C-c>", "<Plug>(coc-cursors-position)", default_opts)
map('n', "<C-d>", "<Plug>(coc-cursors-word)", default_opts)
map('x', "<C-d>", "<Plug>(coc-cursors-range)", default_opts)
map('n', "<leader>x", "<Plug>(coc-cursors-operator)", default_opts)


-- coc-explorer
map("n", "<C-n>", ":CocCommand explorer<CR>", default_opts) -- open/close


map("n", "<leader>.", "<Plug>(coc-codeaction)", {})
map("n", "<leader>l", ":CocCommand eslint.executeAutofix<CR>", {})
map("n", "gd", "<Plug>(coc-definition)", {silent = true})
map("n", "K", ":call CocActionAsync('doHover')<CR>", {silent = true, noremap = true})
map("n", "<leader>rn", "<Plug>(coc-rename)", {})


-- snippets
-- map("i", "<leader>s", "<Plug>(coc-snippets-expand)", default_opts)
map("x", "<leader>x", "<Plug>(coc-convert-snippet)", default_opts)

-- map("v", "<leader>ss", "<Plug>(coc-snippets-select)", default_opts)

-- formater command
map("n", "<leader>f", ":call CocActionAsync('format')<CR>", {noremap = true})
map("x", "<leader>f", " <Plug>(coc-format-selected)<CR>", {noremap = true})
map("v", "<leader>f", " <Plug>(coc-format-selected)<CR>", {noremap = true})



-- show list in fzf
map("n", "<leader>coc", ":CocFzfList<CR>", {noremap = true})
map("n", "<leader>P", ":CocFzfList commands<CR>", {noremap = true})


map("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })
map("i", "<TAB>", "pumvisible() ? '<C-n>' : '<TAB>'", {noremap = true, silent = true, expr = true})
map("i", "<S-TAB>", "pumvisible() ? '<C-p>' : '<C-h>'", {noremap = true, expr = true})
map("i", "<CR>", "pumvisible() ? coc#_select_confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'", {silent = true, expr = true, noremap = true})


g.coc_global_extensions =  {'coc-git', 'coc-json', 'coc-marketplace', 'coc-pairs', 'coc-explorer', 'coc-snippets'}

