-- local status_ok, translate = pcall(require, "translate")
-- if not status_ok then
-- 	return
-- end

require("translate").setup({
	output = {
		float = {
			-- max_width of float window
			max_width = 40,
			-- max_height of float window
			max_height = 5,
			-- whether close float window on cursor move
			close_on_cursor_move = true,
			-- key to enter float window
			enter_key = "T",
		},
	},
	translate = {
		{
			cmd = "TransToEN",
			command = "trans",
			args = function(trans_source)
				return {
					"-b",
					"-e",
					"google",
					"-t",
					"en",
					trans_source,
				}
			end,
			input = "selection",
			output = { "notify", "clipboard", "insert", "float_win" },
		},
	},
})

vim.keymap.set("v", "<space>tle", "<cmd>TransToEN<CR>")
