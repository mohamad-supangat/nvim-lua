--- lua/keymaps.lua ---------------------------------------
-- Keymaps configuration file: keymaps of neovim
-----------------------------------------------------------

local default_opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- packer sync
vim.keymap.set("n", "<leader>uu", ":Lazy<CR>", { noremap = true, silent = true, desc = "Open Lazy.nvim Window" })

-- clear search highlighting
vim.keymap.set("n", "<Esc><Esc>", ":nohl<CR>", { noremap = true, silent = true, desc = "Remove Search highlighting" })

-- map esc
vim.keymap.set("i", "kk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })

-- fast saving with <leader> and s
-- vim.keymap.set("n", "<C-s>", ":update<CR>", { noremap = true, silent = true, desc = "Save buffer" })
-- vim.keymap.set("i", "<C-s>", "<Esc>:update<CR>", { noremap = true, silent = true, desc = "Save buffer" })
-- vim.keymap.set("v", "<C-s>", "<C-C>:update<CR>", { noremap = true, silent = true, desc = "Save buffer" })

-- close all windows and exit from neovim
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = "Exit Neovim" })
vim.keymap.set("n", "<leader>qa", ":quitall!<CR>", { noremap = true, silent = true, desc = "Force Exit" })

-----------------------------------------------------------
-- Plugins shortcuts:
-----------------------------------------------------------

-- indent control
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true, desc = "Indent >" })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true, desc = "Indent <" })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent >" })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent <" })

-- copy paste in neovim
vim.keymap.set("n", "<C-a>", "<Esc>ggVG", { noremap = true, silent = true, desc = "Select All Text in current file" })
vim.keymap.set({ "i", "t" }, "<A-BS>", "<C-W>", { noremap = true, silent = true, desc = "delete word" })
vim.keymap.set("v", "<BS>", '"_d',
    { noremap = true, silent = true, desc = "Delete without cut /copy to buffer clipboard" })
-- vim.keymap.set("n", "dd", '"_d', { noremap = true, silent = true, desc = "Delete without cut /copy to buffer clipboard" })
-- vim.keymap.set("x", "dd", '"_d', { noremap = true, silent = true, desc = "Delete without cut /copy to buffer clipboard" })
-- vim.keymap.set("v", "dd", '"_d', { noremap = true, silent = true, desc = "Delete without cut /copy to buffer clipboard" })
--

-- undo redo
--[[ vim.keymap.set('n', '<C-Z>', 'u', default_opts)
vim.keymap.set('n', '<C-Y>', '<C-R>', default_opts)
vim.keymap.set('i', '<C-Z>', '<C-O>u', default_opts)
vim.keymap.set('i', '<C-Y>', '<C-O><C-R>', default_opts)
vim.keymap.set('v', '<C-Z>', '<C-O>u', default_opts)
vim.keymap.set('v', '<C-Y>', '<C-O><C-R>', default_opts)

 ]]
-- tab
vim.keymap.set("n", "<C-t>", ":enew<CR>", default_opts)
vim.keymap.set("i", "<C-t>", ":<Esc>:enew<CR>i", default_opts)
vim.keymap.set("n", "<C-PageUp>", ":bprevious<CR>", default_opts)
vim.keymap.set("n", "<C-PageDown>", ":bnext<CR>", default_opts)

vim.keymap.set("n", "<C-Shift-h>", ":bprevious<CR>", default_opts)
vim.keymap.set("n", "<C-Shift-l>", ":bnext<CR>", default_opts)

vim.keymap.set("n", "<C-S-Tab>", ":bprevious<CR>", default_opts)
vim.keymap.set("n", "<C-Tab>", ":bnext<CR>", default_opts)

-- vim.keymap.set("n", "bb", ":bprevious<CR>", default_opts)
-- vim.keymap.set("n", "bn", ":bnext<CR>", default_opts)
-- vim.keymap.set("n", "bd", ":lua require('mini.bufremove').delete(0, false)<CR>", default_opts)
-- vim.keymap.set("n", "bD", ":lua require('mini.bufremove').delete(0, true)<CR>", default_opts)

vim.keymap.set("n", "<leader>bb", ":bprevious<CR>", default_opts)
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", default_opts)
vim.keymap.set("n", "<leader>bd", ":lua require('mini.bufremove').delete(0, false)<CR>", default_opts)
vim.keymap.set("n", "<leader>bD", ":lua require('mini.bufremove').delete(0, true)<CR>", default_opts)

-- copy current file path to clipboard
vim.keymap.set("n", "<leader>cf", ":call setreg('*', @%, 'ac')<CR>", { desc = "Copy File Path to clipboard" })
vim.keymap.set("n", "Y", "y$", default_opts) -- Change Y to copy to end of line and behave like C

-- spliting window
vim.keymap.set("n", "<leader>-", "<C-w>s", { noremap = true, silent = true, desc = "Split window horizontal" })
vim.keymap.set("n", "<leader>|", "<C-w>v<C-w>l", { noremap = true, silent = true, desc = "Split window vertical" })

-- search hightligh text
-- vim.keymap.set("v", "/", '"fy/\\V<C-R>f<CR>', { noremap = true, silent = true, desc = "Search current tag" })

-- change current cwd to current file dir
vim.keymap.set(
    "n",
    "<leader>cd",
    ":cd %:p:h<CR>",
    { noremap = true, silent = true, desc = "Change dir to current opened file" }
)
