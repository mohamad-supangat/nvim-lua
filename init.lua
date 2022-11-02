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

--]]--
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

  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- more hgithlight
  use "sheerun/vim-polyglot"
  -- use "tpope/vim-sleuth"

  use {
    'Darazaki/indent-o-matic',
    config = function() require('indent-o-matic').setup {} end,
  }

  -- colorscheme
  use { "catppuccin/nvim", as = "catppuccin" }

  -- filer manager
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
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
  use { "hrsh7th/nvim-cmp" } -- The completion plugin
  use { "hrsh7th/cmp-buffer" } -- buffer completions
  use { "hrsh7th/cmp-path" } -- path completions
  use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua" }

  -- snippets
  use { "L3MON4D3/LuaSnip" } -- snippet engine
  use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons"
  }

  use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  -- use { "RRethy/vim-illuminate" }

  -- another formater with external comandline
  use "sbdchd/neoformat"

  use {
    "nvim-treesitter/nvim-treesitter",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "p00f/nvim-ts-rainbow",
    "windwp/nvim-ts-autotag",
    "windwp/nvim-autopairs",
    "haringsrob/nvim_context_vt"
  }

  use 'simrat39/symbols-outline.nvim' -- A tree like view for symbols in Neovim using the Language Server Protocol

  -- utils
  use "gpanders/editorconfig.nvim"
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "echasnovski/mini.nvim", branch = "stable" }

  use { "danymat/neogen", requires = "nvim-treesitter/nvim-treesitter" }

  use { "LudoPinelli/comment-box.nvim" }

  -- use "christoomey/vim-tmux-navigator"
  use { "alexghergh/nvim-tmux-navigation" }
  use { "numtostr/FTerm.nvim" }

  use { "xiyaowong/accelerated-jk.nvim" }

  use { "ibhagwan/fzf-lua" }

  -- use {
  --     "NvChad/nvim-colorizer.lua",
  --     config = function() require'colorizer'.setup() end
  -- }

  use { 'brenoprata10/nvim-highlight-colors' }

  use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }
  use { "alpertuna/vim-header" }

  use { 'lewis6991/gitsigns.nvim' }
  use { 'dyng/ctrlsf.vim' }

  if packer_bootstrap then require("packer").sync() end
end)

require("settings") -- settings
require("keymaps") -- keymaps
require("configs")
