-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: paq-nvim
-- https://github.com/savq/paq-nvim

vim.cmd "packadd paq-nvim" -- load paq
local paq = require("paq-nvim").paq -- import module with `paq` function

-- Add packages
-- for package info see: init.lua (Lua modules)
require("paq") {
    "savq/paq-nvim", -- let paq manage itself
    "alexghergh/nvim-tmux-navigation",
    "famiu/feline.nvim",
    "ibhagwan/fzf-lua",
    "vijaymarupudi/nvim-fzf",
    "kyazdani42/nvim-web-devicons",
    "kyazdani42/nvim-tree.lua",
    "akinsho/nvim-bufferline.lua",
    "lukas-reineke/indent-blankline.nvim",
    -- 'liuchengxu/vista.vim';
    "nvim-treesitter/nvim-treesitter",
    "p00f/nvim-ts-rainbow",
    "andymass/vim-matchup",
    "windwp/nvim-ts-autotag",
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "b3nj5m1n/kommentary",
    "windwp/nvim-autopairs",
    "folke/tokyonight.nvim",
    "sbdchd/neoformat",
    "nvim-lua/plenary.nvim",
    "lewis6991/gitsigns.nvim", -- git integration
    "xiyaowong/accelerated-jk.nvim", -- fast jk
    "mhinz/vim-startify", -- session manager and last file opened
    "rbgrouleff/bclose.vim", -- close buffer without close split
    "numtostr/FTerm.nvim",
    "editorconfig/editorconfig-vim",
    "folke/trouble.nvim"
}
