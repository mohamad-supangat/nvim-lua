--  ╭──────────────────────────────────────────────────────────╮
--  │ init lua                                                 │
--  │ powered by hantamkoding 2022                             │
--  │                                                          │
--  ╰──────────────────────────────────────────────────────────╯
local fn = vim.fn

-- bootstarping packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path
    })
end

require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use "kyazdani42/nvim-web-devicons"
    use "nvim-lua/plenary.nvim"

    -- more hgithlight
    -- use "sheerun/vim-polyglot"
    use "tpope/vim-sleuth"

    -- colorscheme
    use {"catppuccin/nvim", as = "catppuccin"}

    -- filer manager
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        }
    }

    -- lsp and syntax helper
    -- use {
    --     "neoclide/coc.nvim",
    --     requires = {'honza/vim-snippets'},
    --     branch = "release",
    --     config = function() require("plugins/coc") end
    -- }

    -- use {"antoinemadec/coc-fzf", requires = {"ibhagwan/fzf-lua"}}

    -- cmp plugins
    use {"hrsh7th/nvim-cmp"} -- The completion plugin
    use {"hrsh7th/cmp-buffer"} -- buffer completions
    use {"hrsh7th/cmp-path"} -- path completions
    use {"saadparwaiz1/cmp_luasnip"} -- snippet completions
    use {"hrsh7th/cmp-nvim-lsp"}
    use {"hrsh7th/cmp-nvim-lua"}

    -- snippets
    use {"L3MON4D3/LuaSnip"} -- snippet engine
    use {"rafamadriz/friendly-snippets"} -- a bunch of snippets to use

    -- LSP
    use {"neovim/nvim-lspconfig"} -- enable LSP
    use {"williamboman/nvim-lsp-installer"} -- simple to use language server installer
    use {"jose-elias-alvarez/null-ls.nvim"} -- for formatters and linters
    use {"RRethy/vim-illuminate"}

    -- another formater with external comandline
    use "sbdchd/neoformat"
    -- auto generate commentstring base on treesitter
    use {
        "JoosepAlviste/nvim-ts-context-commentstring",
        requires = {"nvim-treesitter/nvim-treesitter"}
    }

    use {"p00f/nvim-ts-rainbow", requires = {"nvim-treesitter/nvim-treesitter"}}

    use "windwp/nvim-ts-autotag" -- auto close tag
    -- use {"alvan/vim-closetag"}

    use {"windwp/nvim-autopairs"} -- Autopairs, integrates with both cmp and treesitter

    --

    -- utils
    use "gpanders/editorconfig.nvim"
    use {"lukas-reineke/indent-blankline.nvim"}
    use {"echasnovski/mini.nvim", branch = "stable"}

    use {"danymat/neogen", requires = "nvim-treesitter/nvim-treesitter"}

    use {"LudoPinelli/comment-box.nvim"}

    -- use "christoomey/vim-tmux-navigator"
    use {"alexghergh/nvim-tmux-navigation"}
    use {"numtostr/FTerm.nvim"}

    use {"xiyaowong/accelerated-jk.nvim"}

    use {"ibhagwan/fzf-lua"}

    -- use {
    --     "NvChad/nvim-colorizer.lua",
    --     config = function() require'colorizer'.setup() end
    -- }

    use {'brenoprata10/nvim-highlight-colors'}

    use {"folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim"}

    use {'lewis6991/gitsigns.nvim'}

    if packer_bootstrap then require("packer").sync() end
end)

require("settings") -- settings
require("keymaps") -- keymaps
require("configs")
