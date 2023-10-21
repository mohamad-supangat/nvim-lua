--- lua/keymaps.lua ---------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------

local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- packer sync
map("n", "<leader>uu", ":Lazy<CR>", { noremap = true, silent = true, desc = "Open Lazy.nvim Window" })

-- clear search highlighting
map("n", "<Esc><Esc>", ":nohl<CR>", { noremap = true, silent = true, desc = "Remove Search highlighting" })

-- map esc
map("i", "kk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
map("i", "jj", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
map("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })

-- fast saving with <leader> and s
map("n", "<C-s>", ":update<CR>", { noremap = true, silent = true, desc = "Save buffer" })
map("i", "<C-s>", "<Esc>:update<CR>", { noremap = true, silent = true, desc = "Save buffer" })
map("v", "<C-s>", "<C-C>:update<CR>", { noremap = true, silent = true, desc = "Save buffer" })

-- close all windows and exit from neovim
map("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = "Exit Neovim" })
map("n", "<leader>qa", ":quitall!<CR>", { noremap = true, silent = true, desc = "Force Exit" })

-----------------------------------------------------------
-- Plugins shortcuts:
-----------------------------------------------------------

-- indent control
map("v", "<Tab>", ">gv", { noremap = true, silent = true, desc = "Indent >" })
map("v", "<S-Tab>", "<gv", { noremap = true, silent = true, desc = "Indent <" })
map("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent >" })
map("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent <" })

-- copy paste in neovim
map("n", "<C-a>", "<Esc>ggVG", { noremap = true, silent = true, desc = "Select All Text in current file" })
map({ "i", "t" }, "<A-BS>", "<C-W>", { noremap = true, silent = true, desc = "delete word" })
map("v", "<BS>", '"_d', { noremap = true, silent = true, desc = "Delete without cut /copy to buffer clipboard" })

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
map("n", "<leader>-", "<C-w>s", { noremap = true, silent = true, desc = "Split window horizontal" })
map("n", "<leader>|", "<C-w>v<C-w>l", { noremap = true, silent = true, desc = "Split window vertical" })

-- toggle SymbolOutline
map("n", "<f7>", ":SymbolsOutline<CR>", { noremap = true, silent = true, desc = "Open Symbol Outline" })

-- search hightligh text
map("v", "/", '"fy/\\V<C-R>f<CR>', { noremap = true, silent = true, desc = "Search current tag" })

-- toggle zen mode (full screen editing)
map("n", "<leader>ze", ":lua require('zen-mode').toggle()<CR>", { noremap = true, silent = true, desc = "Open zen mode" })

-- change current cwd to current file dir
map("n", "<leader>cd", ":cd %:p:h<CR>", { noremap = true, silent = true, desc = "Change dir to current opened file" })

-- open current buffer in lazygit
map("n", "<leader>gi", ":LazyGitCurrentFile<CR>", { noremap = true, silent = true, desc = "Open lazygit" })
