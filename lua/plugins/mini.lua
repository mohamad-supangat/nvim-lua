-- local palette = require("mini.base16").mini_palette("#1e1e28", "#d7dae0", 60)
--
-- require("mini.base16").setup({
--     palette = palette,
--     name = "minischeme",
--     use_cterm = true
-- })
--
-- require("mini.base16").setup({
--     palette = {
--         base00 = "#1e1e2e",
--         base01 = "#181825",
--         base02 = "#313244",
--         base03 = "#45475a",
--         base04 = "#585b70",
--         base05 = "#cdd6f4",
--         base06 = "#f5e0dc",
--         base07 = "#b4befe",
--         base08 = "#f38ba8",
--         base09 = "#fab387",
--         base0A = "#f9e2af",
--         base0B = "#a6e3a1",
--         base0C = "#94e2d5",
--         base0D = "#89b4fa",
--         base0E = "#cba6f7",
--         base0F = "#f2cdcd"
--     },
--     name = "minischeme",
--     use_cterm = true
-- })
--
-- require('mini.indentscope').setup({
--     draw = {
--         -- Delay (in ms) between event and start of drawing scope indicator
--         delay = 100
--
--         -- Animation rule for scope's first drawing. A function which, given next
--         -- and total step numbers, returns wait time (in ms). See
--         -- |MiniIndentscope.gen_animation()| for builtin options. To not use
--         -- animation, supply `require('mini.indentscope').gen_animation('none')`.
--         -- animation = --<function: implements constant 20ms between steps>,
--     },
--
--     -- Module mappings. Use `''` (empty string) to disable one.
--     mappings = {
--         -- Textobjects
--         object_scope = 'ii',
--         object_scope_with_border = 'ai',
--
--         -- Motions (jump to respective border line; if not present - body line)
--         goto_top = '[i',
--         goto_bottom = ']i'
--     },
--
--     -- Options which control computation of scope. Buffer local values can be
--     -- supplied in buffer variable `vim.b.miniindentscope_options`.
--     options = {
--         -- Type of scope's border: which line(s) with smaller indent to
--         -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
--         border = 'both',
--
--         -- Whether to use cursor column when computing reference indent. Useful to
--         -- see incremental scopes with horizontal cursor movements.
--         indent_at_cursor = true,
--
--         -- Whether to first check input line to be a border of adjacent scope.
--         -- Use it if you want to place cursor on function header to get scope of
--         -- its body.
--         try_as_border = true
--     },
--
--     -- Which character to use for drawing scope indicator
--     symbol = '▏'
-- })
--

local my_items = {
	{ name = "Open nvim tree", action = "NvimTreeOpen", section = "Builtin actions" },

	{ name = "Config: init.lua", action = "e ~/.config/nvim/init.lua", section = "Nvim" },
	{ name = "Snippets: package.json", action = "e ~/.config/nvim/snippets/package.json", section = "Nvim" },
}


local starter = require("mini.starter")
starter.setup({
	autoopen = true,
	evaluate_single = true,
	items = {
		my_items,
		starter.sections.sessions(5, true), -- starter.sections.telescope(),
		starter.sections.builtin_actions(),
		starter.sections.recent_files(10, false),
		starter.sections.recent_files(10, true),
		-- Use this if you set up 'mini.sessions'
	},
	content_hooks = {
		starter.gen_hook.adding_bullet(),
		-- starter.gen_hook.aligning("center", "center"),
		starter.gen_hook.indexing("all", { "Builtin actions" }),
		starter.gen_hook.padding(10, 0),
	},
})

require("mini.comment").setup({
	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		-- Toggle comment (like `gcip` - comment inner paragraph) for both
		-- Normal and Visual modes
		comment = "gc",
		-- Toggle comment on current line
		comment_line = "gcc",
		-- Define 'comment' textobject (like `dgc` - delete whole comment block)
		textobject = "gc",
	},
	-- Hook functions to be executed at certain stage of commenting
	hooks = {
		-- Before successful commenting. Does nothing by default.
		pre = function()
			require("ts_context_commentstring.internal").update_commentstring()
		end,
		-- After successful commenting. Does nothing by default.
		post = function() end,
	},
})

-- require("mini.cursorword").setup()
-- require("mini.trailspace").setup()

-- remove gui window separator for using global statusline
-- vim.cmd [[hi WinSeparator guibg=none]]
require("mini.statusline").setup({ set_vim_settings = false })

-- require("mini.tabline").setup({
--     -- Whether to show file icons (requires 'kyazdani42/nvim-web-devicons')
--     show_icons = true,
--     -- Whether to set Vim's settings for tabline (make it always shown and
--     -- allow hidden buffers)
--     set_vim_settings = true,
--     -- Where to show tabpage section in case of multiple vim tabpages.
--     -- One of 'left', 'right', 'none'.
--     tabpage_section = "left"
-- })
--
-- require('mini.pairs').setup({
--     -- In which modes mappings from this `config` should be created
--     modes = {insert = true, command = false, terminal = false},
--
--     -- Global mappings. Each right hand side should be a pair information, a
--     -- table with at least these fields (see more in |MiniPairs.map|):
--     -- - <action> - one of 'open', 'close', 'closeopen'.
--     -- - <pair> - two character string for pair to be used.
--     -- By default pair is not inserted after `\`, quotes are not recognized by
--     -- `<CR>`, `'` does not insert pair after a letter.
--     -- Only parts of tables can be tweaked (others will use these defaults).
--     mappings = {
--         ['('] = {action = 'open', pair = '()', neigh_pattern = '[^\\].'},
--         ['['] = {action = 'open', pair = '[]', neigh_pattern = '[^\\].'},
--         ['{'] = {action = 'open', pair = '{}', neigh_pattern = '[^\\].'},
--
--         [')'] = {action = 'close', pair = '()', neigh_pattern = '[^\\].'},
--         [']'] = {action = 'close', pair = '[]', neigh_pattern = '[^\\].'},
--         ['}'] = {action = 'close', pair = '{}', neigh_pattern = '[^\\].'},
--
--         ['"'] = {
--             action = 'closeopen',
--             pair = '""',
--             neigh_pattern = '[^\\].',
--             register = {cr = false}
--         },
--         ["'"] = {
--             action = 'closeopen',
--             pair = "''",
--             neigh_pattern = '[^%a\\].',
--             register = {cr = false}
--         },
--         ['`'] = {
--             action = 'closeopen',
--             pair = '``',
--             neigh_pattern = '[^\\].',
--             register = {cr = false}
--         }
--     }
-- })
--
require("mini.surround").setup({
	-- Add custom surroundings to be used on top of builtin ones. For more
	-- information with examples, see `:h MiniSurround.config`.
	custom_surroundings = nil,
	-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
	highlight_duration = 500,
	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		add = "sa", -- Add surrounding in Normal and Visual modes
		delete = "sd", -- Delete surrounding
		find = "sf", -- Find surrounding (to the right)
		find_left = "sF", -- Find surrounding (to the left)
		highlight = "sh", -- Highlight surrounding
		replace = "sr", -- Replace surrounding
		update_n_lines = "sn", -- Update `n_lines`
	},
	-- Number of lines within which surrounding is searched
	n_lines = 20,
	-- How to search for surrounding (first inside current line, then inside
	-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
	-- 'cover_or_nearest'. For more details, see `:h MiniSurround.config`.
	search_method = "cover",
})

require("mini.bufremove").setup({ set_vim_settings = true })

require("mini.sessions").setup({
	-- Whether to read latest session if Neovim opened without file arguments
	autoread = false,
	-- Whether to write current session before quitting Neovim
	autowrite = true,
	-- Directory where global sessions are stored (use `''` to disable)
	-- directory = --<"session" subdir of user data directory from |stdpath()|>,

	-- File for local session (use `''` to disable)
	file = "",
	-- Whether to force possibly harmful actions (meaning depends on function)
	force = { read = false, write = true, delete = false },
	-- Hook functions for actions. Default `nil` means 'do nothing'.
	hooks = {
		-- Before successful action
		pre = { read = nil, write = nil, delete = nil },
		-- After successful action
		post = { read = nil, write = nil, delete = nil },
	},
	-- Whether to print session path after action
	verbose = { read = false, write = true, delete = true },
})
