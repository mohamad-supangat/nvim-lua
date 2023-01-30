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
local fn = vim.fn

-- bootstarping packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  use("kyazdani42/nvim-web-devicons")
  use("nvim-lua/plenary.nvim")

  -- use({
  -- 	"akinsho/bufferline.nvim",
  -- 	tag = "v3.*",
  -- 	requires = "kyazdani42/nvim-web-devicons",
  -- })

  -- use({
  -- 	"noib3/nvim-cokeline",
  -- 	requires = "kyazdani42/nvim-web-devicons", -- If you want devicons
  -- })

  -- more hgithlight
  -- use("sheerun/vim-polyglot")
  -- use "tpope/vim-sleuth"
  --
  -- use({
  --   "Darazaki/indent-o-matic",
  --   config = function()
  --     require("indent-o-matic").setup({})
  --   end,
  -- })

  -- colorscheme
  -- use({ "catppuccin/nvim", as = "catppuccin" })

  use({
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = true,
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      })
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd([[colorscheme gruvbox]])
    end,
  })

  -- filer manager
  -- use({
  -- 	"nvim-tree/nvim-tree.lua",
  -- 	requires = {
  -- 		"nvim-tree/nvim-web-devicons", -- optional, for file icons
  -- 	},
  -- 	tag = "nightly", -- optional, updated every week. (see issue #1193)
  -- })

  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      {
        -- only needed if you want to use the commands with "_with_window_picker" suffix
        "s1n7ax/nvim-window-picker",
        tag = "v1.*",
      },
    },
  })
  -- lsp and syntax helper
  -- use {
  --     "neoclide/coc.nvim",
  --     requires = {'honza/vim-snippets'},
  --     branch = "release",
  --     config = function() require("plugins/coc") end
  -- }

  -- use {"antoinemadec/coc-fzf", requires = {"ibhagwan/fzf-lua"}}

  -- cmp plugins
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      -- "jcha0713/cmp-tw2css",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      -- "onsails/lspkind.nvim",
    },
  })

  -- snippets
  use({ "L3MON4D3/LuaSnip" }) -- snippet engine
  use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

  -- LSP
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  })

  use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })

  use({ "jose-elias-alvarez/null-ls.nvim" })
  -- for formatters and linters
  -- use({ "RRethy/vim-illuminate" })

  -- another formater with external comandline
  use("sbdchd/neoformat")

  use({
    "nvim-treesitter/nvim-treesitter",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "p00f/nvim-ts-rainbow",
    "windwp/nvim-ts-autotag",
    "windwp/nvim-autopairs",
    "haringsrob/nvim_context_vt",
  })

  use("simrat39/symbols-outline.nvim") -- A tree like view for symbols in Neovim using the Language Server Protocol

  -- utils
  use("gpanders/editorconfig.nvim")
  use({ "lukas-reineke/indent-blankline.nvim" })
  use({ "echasnovski/mini.nvim", branch = "stable" })

  use({ "danymat/neogen", requires = "nvim-treesitter/nvim-treesitter" })

  use({ "aserowy/tmux.nvim" })
  use({ "numtostr/FTerm.nvim" })

  use({ "xiyaowong/accelerated-jk.nvim" })

  use({ "ibhagwan/fzf-lua" })

  use({ "brenoprata10/nvim-highlight-colors" })

  use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })
  use({ "alpertuna/vim-header" })

  use({ "lewis6991/gitsigns.nvim" })
  -- use({ "dyng/ctrlsf.vim" })

  use({ "windwp/nvim-spectre",
    config = function()
      require('spectre').setup()
    end,
  })
  use({
    "beauwilliams/focus.nvim",
    config = function()
      require("focus").setup()
    end,
  })

  use({ "CRAG666/code_runner.nvim", requires = "nvim-lua/plenary.nvim" })
  use({ "Abstract-IDE/penvim" })
  use({ "weirongxu/plantuml-previewer.vim", requires = "tyru/open-browser.vim" })
  use({ "kdheepak/lazygit.nvim" })
  -- use({
  -- 	"anuvyklack/pretty-fold.nvim",
  -- })

  if packer_bootstrap then
    require("packer").sync()
  end
end)

require("settings") -- settings
require("keymaps") -- keymaps
require("configs")
