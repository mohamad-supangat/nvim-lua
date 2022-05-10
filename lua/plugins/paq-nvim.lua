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
    {"neoclide/coc.nvim", branch="release"},
    "honza/vim-snippets",

    --------------------------------------------
    -- End LSP
    --------------------------------------------

    "b3nj5m1n/kommentary",
    "projekt0n/github-nvim-theme",
    "sainnhe/gruvbox-material",

    "sbdchd/neoformat",
    "nvim-lua/plenary.nvim",

    "xiyaowong/accelerated-jk.nvim",
    "goolord/alpha-nvim",
    "rbgrouleff/bclose.vim",
    "akinsho/toggleterm.nvim",
    "gpanders/editorconfig.nvim",
    -- "Shatur/neovim-session-manager"

    "alvan/vim-closetag",


    "mattn/emmet-vim"
}
