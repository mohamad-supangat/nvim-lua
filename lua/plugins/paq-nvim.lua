-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Add packages
-- for package info see: init.lua (Lua modules)
require("paq") {
    "savq/paq-nvim",

    ----------------------------------------------
    -- Status line buffer and some required plugins
    "nvim-lua/plenary.nvim",
    "alexghergh/nvim-tmux-navigation",
    "nvim-lualine/lualine.nvim",
    "akinsho/nvim-bufferline.lua",
    "lukas-reineke/indent-blankline.nvim",


    --------------------------------------------
    -- file finder
    "ibhagwan/fzf-lua",
    "vijaymarupudi/nvim-fzf",

    ----------------------------------------------
    -- Theme
    "projekt0n/github-nvim-theme",
    "sainnhe/gruvbox-material",
    "RRethy/nvim-base16",



    -------------------------------------------------
    -- Icon
    "kyazdani42/nvim-web-devicons",
    -- "projekt0n/circles.nvim",


    'liuchengxu/vista.vim',

    -------------------------------------------
    -- Auto config, indent, syntax hightlight
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
    "sbdchd/neoformat",


    "xiyaowong/accelerated-jk.nvim",
    "goolord/alpha-nvim",
    "rbgrouleff/bclose.vim",
    "numtostr/FTerm.nvim",

    "gpanders/editorconfig.nvim",


    ---------------------------------------
    -- auto close tag helper
    "alvan/vim-closetag",
    "mattn/emmet-vim"
}
