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

require("settings") -- settings
require("keymaps") -- keymaps

require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use "kyazdani42/nvim-web-devicons"
    use "nvim-lua/plenary.nvim"

    -- more hgithlight
    use "sheerun/vim-polyglot"
    use "tpope/vim-sleuth"

    -- lsp and syntax helper
    use {
        "neoclide/coc.nvim",
        branch = "release",
        config = function() require("plugins/coc") end
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function() require("plugins/treesitter") end
    }

    use {
        "code-biscuits/nvim-biscuits",
        requires = {"nvim-treesitter/nvim-treesitter"},
        config = function() require("plugins/treesitter") end
    }

    use {
        "p00f/nvim-ts-rainbow",
        requires = {"nvim-treesitter/nvim-treesitter"},
        config = function() require("plugins/treesitter") end
    }

    -- auto generate commentstring base on treesitter
    use {
        "JoosepAlviste/nvim-ts-context-commentstring",
        requires = {"nvim-treesitter/nvim-treesitter"},
        config = function() require("plugins/treesitter") end
    }

    use "honza/vim-snippets"
    use {
        "alvan/vim-closetag",
        config = function() require("plugins/auto-closetag") end
    }

    -- utils
    use "gpanders/editorconfig.nvim"
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function() require("plugins/indentline") end
    }
    use {
        "echasnovski/mini.nvim",
        branch = "stable",
        config = function() require("plugins/mini") end
    }
    use "sbdchd/neoformat"
    use {
        "danymat/neogen",
        requires = "nvim-treesitter/nvim-treesitter",
        config = function() require("plugins.comment") end
        -- Uncomment next line if you want to follow only stable versions
        -- tag = "*"
    }

    use {
        'LudoPinelli/comment-box.nvim',
        config = function() require("plugins.comment") end
    }
    use "christoomey/vim-tmux-navigator"
    use {
        "numtostr/FTerm.nvim",
        config = function() require("plugins/floatterm") end
    }

    use {
        "xiyaowong/accelerated-jk.nvim",
        config = function() require("plugins/accelerated-jk") end
    }

    use {"ibhagwan/fzf-lua", config = function() require("plugins/fzf") end}
    use {"antoinemadec/coc-fzf", requires = {"ibhagwan/fzf-lua"}}

    if packer_bootstrap then require("packer").sync() end
end)

