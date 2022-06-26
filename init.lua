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

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
end

require("settings") -- settings
require("keymaps") -- keymaps

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use "kyazdani42/nvim-web-devicons"
    use "nvim-lua/plenary.nvim"

    -- lsp and syntax helper
    use {
        "neoclide/coc.nvim",
        branch = "release",
        config = function() require("plugins/coc") end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require("plugins/treesitter") end
    }

    use "sheerun/vim-polyglot"
    use "tpope/vim-sleuth"
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
        'echasnovski/mini.nvim',
        branch = 'stable',
        config = function() require("plugins/mini") end
    }
    use "sbdchd/neoformat"
    use "rbgrouleff/bclose.vim"
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
    use {'antoinemadec/coc-fzf', requires = {'ibhagwan/fzf-lua'}}

    if packer_bootstrap then require('packer').sync() end
end)

-- -----------------------------------------------------------
-- -- Import Lua modules
-- -----------------------------------------------------------
--
-- require("plugins/paq-nvim") -- plugin manager
--
-- -- require('plugins.circle-nvim')
-- require("plugins/bufferline") -- beautiful bufferline
--
-- require('plugins/vista')            -- tag viewer
--
-- require("plugins/alpha-nvim") -- dashboard
-- require("plugins/indentline") -- indent line
-- require("plugins/comment") -- auto comment
-- require("plugins/floatterm") -- floating terminal
-- require("plugins/fzf") -- file search
--
-- require("plugins/accelerated-jk") -- accelerated-jk
-- -- require('plugins/colorizer')        -- show color in editor
--
-- -- require("plugins/nvim-gps")
-- require("plugins/statusline") -- statusline
-- -- require("plugins/session-manager")
-- require("plugins/coc")
-- require("plugins/auto-closetag")
