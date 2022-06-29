--[[

  ██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗
  ██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
  ██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
  ██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
  ██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝

Neovim init file


Version: -2.3.0 - 2021/10/02

https://hantamkoding.gitlab.io
--]] local fn = vim.fn
local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

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

    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    use {
        "code-biscuits/nvim-biscuits",
        requires = {"nvim-treesitter/nvim-treesitter"}
    }

    use {"p00f/nvim-ts-rainbow", requires = {"nvim-treesitter/nvim-treesitter"}}

    -- auto generate commentstring base on treesitter
    use {
        "JoosepAlviste/nvim-ts-context-commentstring",
        requires = {"nvim-treesitter/nvim-treesitter"}
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
        config = function()
            require('neogen').setup {}

            map("n", "<Leader>nf", ":lua require('neogen').generate()<CR>",
                default_opts)
        end,
        requires = "nvim-treesitter/nvim-treesitter"
        -- Uncomment next line if you want to follow only stable versions
        -- tag = "*"
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

require("plugins/treesitter")
