-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Add packages
-- for package info see: init.lua (Lua modules)
require("paq") {
    "savq/paq-nvim",
    "alexghergh/nvim-tmux-navigation",
    "famiu/feline.nvim",
    "ibhagwan/fzf-lua",
    "vijaymarupudi/nvim-fzf",
    "kyazdani42/nvim-web-devicons",
    -- "projekt0n/circles.nvim",

    "kyazdani42/nvim-tree.lua",
    "akinsho/nvim-bufferline.lua",
    "lukas-reineke/indent-blankline.nvim",
    -- 'liuchengxu/vista.vim';

    -------------------------------------------
    -- treesitter section
    -------------------------------------------
    "nvim-treesitter/nvim-treesitter",
    "p00f/nvim-ts-rainbow",
    "windwp/nvim-ts-autotag",
    "SmiteshP/nvim-gps",
    -- "code-biscuits/nvim-biscuits",

    --------------------------------------------
    -- LSP
    --------------------------------------------
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/nvim-cmp",
    "SirVer/ultisnips",
    "honza/vim-snippets",
    "quangnguyen30192/cmp-nvim-ultisnips",
    "folke/trouble.nvim",
    --------------------------------------------
    -- End LSP
    --------------------------------------------

    "b3nj5m1n/kommentary",
    "windwp/nvim-autopairs",
    "projekt0n/github-nvim-theme",
    "sbdchd/neoformat",
    "nvim-lua/plenary.nvim",
    "lewis6991/gitsigns.nvim",
    "xiyaowong/accelerated-jk.nvim",
    "goolord/alpha-nvim",
    "rbgrouleff/bclose.vim",
    "numtostr/FTerm.nvim",
    "gpanders/editorconfig.nvim",
    "Shatur/neovim-session-manager"
}
