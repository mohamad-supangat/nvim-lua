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
    -- use "sheerun/vim-polyglot"
    use "tpope/vim-sleuth"

    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function() require("plugins/catppuccin") end
    }

    -- lsp and syntax helper
    use {
        "neoclide/coc.nvim",
        requires = {'honza/vim-snippets'},
        branch = "release",
        config = function() require("plugins/coc") end
    }

    -- auto generate commentstring base on treesitter
    use {
        "JoosepAlviste/nvim-ts-context-commentstring",
        requires = {"nvim-treesitter/nvim-treesitter", "p00f/nvim-ts-rainbow"},
        config = function() require("plugins/treesitter") end
    }

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
        "LudoPinelli/comment-box.nvim",
        config = function() require("plugins.comment") end
    }
    -- use "christoomey/vim-tmux-navigator"
    use {
        "alexghergh/nvim-tmux-navigation",
        config = function()
            require"nvim-tmux-navigation".setup {
                disable_when_zoomed = true, -- defaults to false
                keybindings = {
                    left = "<C-h>",
                    down = "<C-j>",
                    up = "<C-k>",
                    right = "<C-l>",
                    last_active = "<C-\\>",
                    next = "<C-Space>"
                }
            }
        end
    }
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

    -- use {
    --     "NvChad/nvim-colorizer.lua",
    --     config = function() require'colorizer'.setup() end
    -- }

    use {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup {
                render = 'background', -- or 'foreground' or 'first_column'
                enable_tailwind = false
            }
        end
    }

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    }

    if packer_bootstrap then require("packer").sync() end
end)
