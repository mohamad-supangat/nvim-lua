-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Add packages
-- for package info see: init.lua (Lua modules)
require("paq") {
    "savq/paq-nvim",
    "alexghergh/nvim-tmux-navigation",
    "nvim-lualine/lualine.nvim",
    "ibhagwan/fzf-lua",
    "vijaymarupudi/nvim-fzf",
    "kyazdani42/nvim-web-devicons",
    -- "projekt0n/circles.nvim",

    "akinsho/nvim-bufferline.lua",
    "lukas-reineke/indent-blankline.nvim",
    'liuchengxu/vista.vim',

    -------------------------------------------
    -- Auto config
    -------------------------------------------
    "sheerun/vim-polyglot",
    "tpope/vim-sleuth",

    --------------------------------------------
    -- LSP
    --------------------------------------------

    -- uncomment if using coc nvim
    --[[ {"neoclide/coc.nvim", branch="release"},
    "honza/vim-snippets", ]]

    "windwp/nvim-autopairs",
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
    "projekt0n/github-nvim-theme",
    "sainnhe/gruvbox-material",

    "sbdchd/neoformat",
    "nvim-lua/plenary.nvim",
    "lewis6991/gitsigns.nvim",

    "xiyaowong/accelerated-jk.nvim",
    "goolord/alpha-nvim",
    "rbgrouleff/bclose.vim",
    "numtostr/FTerm.nvim",
    "gpanders/editorconfig.nvim",
    -- "Shatur/neovim-session-manager"

    "alvan/vim-closetag",


    "mattn/emmet-vim"
}
