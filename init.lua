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
	use("sheerun/vim-polyglot")
	-- use "tpope/vim-sleuth"

	use({
		"Darazaki/indent-o-matic",
		config = function()
			require("indent-o-matic").setup({})
		end,
	})

	-- colorscheme
	-- use({ "catppuccin/nvim", as = "catppuccin" })
	-- use("EdenEast/nightfox.nvim")
	-- use({
	-- 	"projekt0n/github-nvim-theme",
	-- 	config = function()
	-- 		require("github-theme").setup({
	-- 			theme_style = "dark_default",
	-- 			comment_style = "italic",
	-- 			keyword_style = "italic",
	-- 			function_style = "italic",
	-- 			variable_style = "italic",
	-- 			dark_sidebar = true,
	-- 			sidebars = { "qf", "vista_kind", "terminal", "packer", "NvimTree" },
	-- 		})
	-- 	end,
	-- })

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
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- use({ "ms-jpq/chadtree", branch = "chad", run = "python3 -m chadtree deps" })

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

	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
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

	use({ "LudoPinelli/comment-box.nvim" })

	-- use "christoomey/vim-tmux-navigator"
	use({ "alexghergh/nvim-tmux-navigation" })
	use({ "numtostr/FTerm.nvim" })

	use({ "xiyaowong/accelerated-jk.nvim" })

	use({ "ibhagwan/fzf-lua" })

	-- use {
	--     "NvChad/nvim-colorizer.lua",
	--     config = function() require'colorizer'.setup() end
	-- }

	use({ "brenoprata10/nvim-highlight-colors" })

	use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "alpertuna/vim-header" })

	use({ "lewis6991/gitsigns.nvim" })
	use({ "dyng/ctrlsf.vim" })

	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({})
		end,
	})

	-- use({ "CRAG666/code_runner.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "Abstract-IDE/penvim" })

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
