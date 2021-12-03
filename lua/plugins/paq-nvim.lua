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
    "savq/paq-nvim",                          -- let paq manage itself
    "alexghergh/nvim-tmux-navigation",        -- better tmux integrations
    "famiu/feline.nvim",                      -- statusline
    "ibhagwan/fzf-lua",                       -- fzf base on lua
    "vijaymarupudi/nvim-fzf",

    "brooth/far.vim",                         -- find and replace

    "kyazdani42/nvim-web-devicons",           -- icon for neovim
    "kyazdani42/nvim-tree.lua",               -- nvim tree file manager base on Lua


    "akinsho/nvim-bufferline.lua",            -- buffer and tab manager
    "lukas-reineke/indent-blankline.nvim",    -- indentline blank line plugin
    -- 'liuchengxu/vista.vim';
    "nvim-treesitter/nvim-treesitter",        -- treesitter
    "p00f/nvim-ts-rainbow",                   -- rainbow brackets
    "windwp/nvim-ts-autotag",                 -- auto tag base on treesitter
    -- "code-biscuits/nvim-biscuits",
    "neovim/nvim-lspconfig",                  -- neovim lsp configuration
    "williamboman/nvim-lsp-installer",        -- neovim lsp auto installer


   "hrsh7th/cmp-nvim-lsp",
   "hrsh7th/cmp-buffer",
   "hrsh7th/cmp-path",
   "hrsh7th/cmp-cmdline",
   "hrsh7th/nvim-cmp",


   "hrsh7th/cmp-vsnip",
   "hrsh7th/vim-vsnip",


    "b3nj5m1n/kommentary",                   -- auto comment plugin
    "windwp/nvim-autopairs",                 -- auto pair
    "tanvirtin/monokai.nvim",              -- colorschemes
    "sbdchd/neoformat",                      -- formater



    -- "sheerun/vim-polyglot",
    "nvim-lua/plenary.nvim",
    "lewis6991/gitsigns.nvim",              -- git integration
    "xiyaowong/accelerated-jk.nvim",        -- fast jk
    "mhinz/vim-startify",                   -- session manager and last file opened
    "rbgrouleff/bclose.vim",                -- close buffer without close split
    "numtostr/FTerm.nvim",                  -- floating terminal
    "editorconfig/editorconfig-vim",        -- editor config integration
    "folke/trouble.nvim",                   -- diagnostic error
    "mg979/vim-visual-multi",                -- enable multiple cursor,
    "norcalli/nvim-colorizer.lua"           -- show color in text editor
}
