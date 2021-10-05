--- lua/keymaps.lua ---------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- clear search highlighting
map('n', '<Esc><Esc>', ':nohl<CR>', default_opts)

-- map esc
map('i', 'kk', '<Esc>', {noremap = true})
map('i', 'jj', '<Esc>', {noremap = true})
map('i', 'jk', '<Esc>', {noremap = true})

-- fast saving with <leader> and s
map('n', '<C-s>', ':update<CR>', default_opts)
map('i', '<C-s>', '<Esc>:update<CR>', default_opts)
map('v', '<C-s>', '<C-C>:update<CR>', default_opts)


-- close all windows and exit from neovim
map('n', '<leader>q', ':quitall<CR>', default_opts)

-- basic autopair
-- Use this if you don't want a plugin for brackets autopairs
-- slow when closing "{}" :(

--[[
map('i', '"', '""<left>', default_opts)
map('i', '`', '``<left>', default_opts)
map('i', '(', '()<left>', default_opts)
map('i', '[', '[]<left>', default_opts)
map('i', '{', '{}<left>', default_opts)
map('i', '{<CR>', '{<CR}<ESC>0', default_opts)
map('i', '{;<CR>', '{<CR};<ESC>0', default_opts)
--]]

-----------------------------------------------------------
-- Plugins shortcuts:
-----------------------------------------------------------
-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', default_opts)       -- open/close
map('n', '<leader>r', ':NvimTreeRefresh<CR>', default_opts)  -- refresh
-- map('n', '<leader>n', ':NvimTreeFindFile<CR>', default_opts) -- search file

-- Vista
map('', '<C-m>', ':Vista<CR>', default_opts)  -- open/close vista window

-- Fzf lua
map('', '<C-p>', ':lua require(\'fzf-lua\').files()<CR>', default_opts) -- file search


-- indent control
map('v', '<Tab>','>gv', default_opts)
map('v', '<S-Tab>','<gv', default_opts)


-- copy paste in neovim


map('n', '<C-a>','<Esc>ggVG', default_opts) -- select all text in normal mode
map('i', '<A-BS>', '<C-W>', default_opts) -- alt + backspace delete word
map('v', '<BS>', '"_d', default_opts) -- delete witout cut / copy to buffer



-- neovim tmux nvim-tmux-navigation
map('n', "<C-h>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", { noremap = true, silent = true })
map('n', "<C-j>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", { noremap = true, silent = true })
map('n', "<C-k>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", { noremap = true, silent = true })
map('n', "<C-l>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", { noremap = true, silent = true })
map('n', "<C-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>", { noremap = true, silent = true })
map('n', "<C-Space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>", { noremap = true, silent = true })



-- undo redo
map('n', '<C-Z>', 'u', default_opts)
map('n', '<C-Y>', '<C-R>', default_opts)
map('i', '<C-Z>', '<C-O>u', default_opts)
map('i', '<C-Y>', '<C-O><C-R>', default_opts)
map('v', '<C-Z>', '<C-O>u', default_opts)
map('v', '<C-Y>', '<C-O><C-R>', default_opts)


-- tab
map('n', '<C-t>', ':enew<CR>', default_opts)
map('i', '<C-t>', ':<Esc>:enew<CR>i', default_opts)
map('n', '<C-PageUp>', ':bprevious<CR>', default_opts)
map('n', '<C-PageDown>', ':bnext<CR>', default_opts)

map('n', '<C-S-Tab>', ':bprevious<CR>', default_opts)
map('n', '<C-Tab>', ':bnext<CR>', default_opts)

map('n', '<leader>bb', ':bprevious<CR>', default_opts)
map('n', '<leader>bn', ':bnext<CR>', default_opts)

map('n', 'Y', 'y$', default_opts) -- Change Y to copy to end of line and behave like C


-- spliting window
map('n', '<leader>-','<C-w>s', default_opts)
map('n', '<leader>|', '<C-w>v<C-w>l',default_opts)
