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

    "kyazdani42/nvim-web-devicons",           -- icon for neovim
    -- "kyazdani42/nvim-tree.lua",               -- nvim tree file manager base on Lua
    "ms-jpq/chadtree",


    "akinsho/nvim-bufferline.lua",            -- buffer and tab manager
    "lukas-reineke/indent-blankline.nvim",    -- indentline blank line plugin
    -- 'liuchengxu/vista.vim';
    "nvim-treesitter/nvim-treesitter",        -- treesitter
    "p00f/nvim-ts-rainbow",                   -- rainbow brackets
    "windwp/nvim-ts-autotag",                 -- auto tag base on treesitter
    -- "code-biscuits/nvim-biscuits",
    "neovim/nvim-lspconfig",                  -- neovim lsp configuration
    "williamboman/nvim-lsp-installer",        -- neovim lsp auto installer
    "hrsh7th/nvim-cmp",                       -- completion plugin
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",

    "b3nj5m1n/kommentary",                   -- auto comment plugin
    "windwp/nvim-autopairs",                 -- auto pair
    "sainnhe/gruvbox-material",              -- colorschemes
    "sbdchd/neoformat",                      -- formater



    "sheerun/vim-polyglot",
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
