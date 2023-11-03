--[[--
init.lua
Copyright (c) 2022 Mohamad Supangat <moha.supangat@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

--]]
--
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("pre-settings")

require("lazy").setup({
    "nvim-lua/plenary.nvim",
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            {
                "s1n7ax/nvim-window-picker",
                version = "v1.*",
            },
        },
    },

    -- neovim completion plugin and some helper
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-cmdline",
            -- "jcha0713/cmp-tw2css",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "lukas-reineke/cmp-under-comparator",
        },
    },

    -- snippets list and group
    {

        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",

        -- odoo snippets
        "droggol/VscOdooSnippets",

        -- laravel snippets
        "onecentlin/laravel5-snippets-vscode",
        "onecentlin/laravel-blade-snippets-vscode",
        "ahinkle/vscode-laravel-model-snippets",
        "use-the-fork/laravel-vscode-snippets",

        -- quasar snippets
        "Abdelaziz18003/vscode-quasar-snippets",
        "mohamad-supangat/snippets",
    },

    -- {
    --     "sainnhe/gruvbox-material",
    --     config = function()
    --         require('colorscheme.gruvbox-material')
    --     end
    -- },

    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    -- },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },


    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            { "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
            -- "lukas-reineke/lsp-format.nvim"
        },
    },
    {
        "creativenull/efmls-configs-nvim",
        dependencies = { "neovim/nvim-lspconfig" },
    },
    -- {
    --     "hinell/lsp-timeout.nvim",
    --     dependencies = { "neovim/nvim-lspconfig" },
    --     init = function()
    --         vim.g.lspTimeoutConfig = {
    --             -- see config below
    --         }
    --     end
    -- },
    "numToStr/Comment.nvim",
    -- syntax viewer
    {
        "sheerun/vim-polyglot",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
            "HiPhish/rainbow-delimiters.nvim",
            -- "windwp/nvim-ts-autotag",
            "windwp/nvim-autopairs",
            -- "nvim-treesitter/nvim-treesitter-context",
        },
    },

    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            -- configurations go here
        },
    },

    "alvan/vim-closetag",
    "gpanders/editorconfig.nvim",

    {
        "shellRaining/hlchunk.nvim",
        event = { "UIEnter" },
    },

    { "echasnovski/mini.nvim" },

    -- comment document generator
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter"
    },

    { "aserowy/tmux.nvim" },

    { "numToStr/FTerm.nvim" },
    { "xiyaowong/accelerated-jk.nvim" },
    { "ibhagwan/fzf-lua" },

    { "brenoprata10/nvim-highlight-colors", event = "VeryLazy", },

    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        event = "VeryLazy",
    },
    -- { "alpertuna/vim-header" },
    --
    { "lewis6991/gitsigns.nvim" },
    {
        "simrat39/symbols-outline.nvim",
        cmd = 'SymbolsOutline'
    },
    { "windwp/nvim-spectre",    cmd = 'Spectre' },

    {
        "CRAG666/code_runner.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        cmd = {
            'RunCode', 'RunFile', 'RunProject', 'RunClose', 'CRFiletype', 'CRProjects'
        }
    },

    { "kdheepak/lazygit.nvim" },
    {
        "folke/zen-mode.nvim",
        cmd = 'ZenMode',
        opts = {
            window = {
                width = 0.99,
            },
        },
    },

    -- {
    --     "akinsho/flutter-tools.nvim",
    --     lazy = false,
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --     },
    --     config = true,
    -- },

    -- best translate plugin
    { "potamides/pantran.nvim" },


    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            {
                "rcarriga/nvim-notify",
            }
        }
    },
    {
        "chrisgrieser/nvim-recorder",
        dependencies = "rcarriga/nvim-notify",
        opts = {
            clear = true
        }
    },
})

require("settings") -- settings
require("keymaps")  -- keymaps
require("configs")
