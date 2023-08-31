--- lua/keymaps.lua ---------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- packer sync
map("n", "<leader>uu", ":Lazy<CR>", default_opts)

-- clear search highlighting
map("n", "<Esc><Esc>", ":nohl<CR>", default_opts)

-- map esc
map("i", "kk", "<Esc>", { noremap = true })
map("i", "jj", "<Esc>", { noremap = true })
map("i", "jk", "<Esc>", { noremap = true })

-- fast saving with <leader> and s
map("n", "<C-s>", ":update<CR>", default_opts)
map("i", "<C-s>", "<Esc>:update<CR>", default_opts)
map("v", "<C-s>", "<C-C>:update<CR>", default_opts)

-- close all windows and exit from neovim
map("n", "<leader>q", ":q<CR>", default_opts)
map("n", "<leader>qa", ":quitall!<CR>", default_opts)

-----------------------------------------------------------
-- Plugins shortcuts:
-----------------------------------------------------------

-- indent control
map("v", "<Tab>", ">gv", default_opts)
map("v", "<S-Tab>", "<gv", default_opts)
map("v", ">", ">gv", default_opts)
map("v", "<", "<gv", default_opts)

-- copy paste in neovim
map("n", "<C-a>", "<Esc>ggVG", default_opts) -- select all text in normal mode
map("i", "<A-BS>", "<C-W>", default_opts) -- alt + backspace delete word
map("v", "<BS>", '"_d', default_opts) -- delete witout cut / copy to buffer

-- undo redo
--[[ map('n', '<C-Z>', 'u', default_opts)
map('n', '<C-Y>', '<C-R>', default_opts)
map('i', '<C-Z>', '<C-O>u', default_opts)
map('i', '<C-Y>', '<C-O><C-R>', default_opts)
map('v', '<C-Z>', '<C-O>u', default_opts)
map('v', '<C-Y>', '<C-O><C-R>', default_opts)

 ]]
-- tab
map("n", "<C-t>", ":enew<CR>", default_opts)
map("i", "<C-t>", ":<Esc>:enew<CR>i", default_opts)
map("n", "<C-PageUp>", ":bprevious<CR>", default_opts)
map("n", "<C-PageDown>", ":bnext<CR>", default_opts)

map("n", "<C-Shift-h>", ":bprevious<CR>", default_opts)
map("n", "<C-Shift-l>", ":bnext<CR>", default_opts)

map("n", "<C-S-Tab>", ":bprevious<CR>", default_opts)
map("n", "<C-Tab>", ":bnext<CR>", default_opts)

-- map("n", "bb", ":bprevious<CR>", default_opts)
-- map("n", "bn", ":bnext<CR>", default_opts)
-- map("n", "bd", ":lua require('mini.bufremove').delete(0, false)<CR>", default_opts)
-- map("n", "bD", ":lua require('mini.bufremove').delete(0, true)<CR>", default_opts)

map("n", "<leader>bb", ":bprevious<CR>", default_opts)
map("n", "<leader>bn", ":bnext<CR>", default_opts)
map("n", "<leader>bd", ":lua require('mini.bufremove').delete(0, false)<CR>", default_opts)
map("n", "<leader>bD", ":lua require('mini.bufremove').delete(0, true)<CR>", default_opts)

map("n", "Y", "y$", default_opts) -- Change Y to copy to end of line and behave like C

-- spliting window
map("n", "<leader>-", "<C-w>s", default_opts)
map("n", "<leader>|", "<C-w>v<C-w>l", default_opts)

-- toggle SymbolOutline
map("n", "<f7>", ":SymbolsOutline<CR>", default_opts)

-- search hightligh text
map("v", "/", '"fy/\\V<C-R>f<CR>', default_opts)

-- toggle zen mode (full screen editing)
map("n", "<leader>zen", ":lua require('zen-mode').toggle()<CR>", default_opts)

-- change current cwd to current file dir
map("n", "<leader>cd", ":cd %:p:h<CR>", default_opts)

-- open current buffer in lazygit
map("n", "<leader>git", ":LazyGitCurrentFile<CR>", default_opts)
