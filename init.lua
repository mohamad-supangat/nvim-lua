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

require("lazy").setup({
	"folke/lazy.nvim",
	"nvim-tree/nvim-web-devicons",
	"nvim-lua/plenary.nvim",
	{
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
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				"s1n7ax/nvim-window-picker",
				version = "v1.*",
			},
		},
	},
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

			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			-- "onsails/lspkind.nvim",
		},
	},
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	{ "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	"sbdchd/neoformat",
	{
		"nvim-treesitter/nvim-treesitter",
		"JoosepAlviste/nvim-ts-context-commentstring",
		"mrjones2014/nvim-ts-rainbow",
		"windwp/nvim-ts-autotag",
		"windwp/nvim-autopairs",
		"haringsrob/nvim_context_vt",
	},
	"gpanders/editorconfig.nvim",
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "echasnovski/mini.nvim", branch = "stable" },
	{ "danymat/neogen", dependencies = "nvim-treesitter/nvim-treesitter" },

	{ "aserowy/tmux.nvim" },
	{ "numtostr/FTerm.nvim" },

	{ "xiyaowong/accelerated-jk.nvim" },

	{ "ibhagwan/fzf-lua" },

	{ "brenoprata10/nvim-highlight-colors" },

	{ "folke/todo-comments.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{ "alpertuna/vim-header" },

	{ "lewis6991/gitsigns.nvim" },
	"simrat39/symbols-outline.nvim",

	{
		"windwp/nvim-spectre",
		config = function()
			require("spectre").setup()
		end,
	},
	{
		"beauwilliams/focus.nvim",
		config = function()
			require("focus").setup()
		end,
	},

	{ "CRAG666/code_runner.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{ "weirongxu/plantuml-previewer.vim", dependencies = "tyru/open-browser.vim" },
	{ "kdheepak/lazygit.nvim" },
})

require("settings") -- settings
require("keymaps") -- keymaps
require("configs")
