local status_ok, cokeline = pcall(require, "cokeline")
if not status_ok then
	return
end
local get_hex = require("cokeline/utils").get_hex

local yellow = vim.g.terminal_color_3

require("cokeline").setup({

	sidebar = {
		filetype = "NvimTree",
		components = {
			{
				text = "  NvimTree",
				fg = yellow,
				bg = get_hex("NvimTreeNormal", "bg"),
				style = "bold",
			},
		},
	},

	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
		end,
		bg = function(buffer)
			return buffer.is_focused and get_hex("Visual", "bg") or get_hex("Normal", "bg")
		end,
	},

	components = {
		{
			text = " ",
			bg = get_hex("Normal", "bg"),
		},
		{
			text = "",
			fg = function(buffer)
				return buffer.is_focused and get_hex("Visual", "bg") or get_hex("Visual", "fg")
			end,
			bg = get_hex("Normal", "bg"),
		},
		{
			text = function(buffer)
				return buffer.devicon.icon
			end,
			fg = function(buffer)
				return buffer.devicon.color
			end,
		},
		{
			text = " ",
		},
		{
			text = function(buffer)
				return buffer.filename .. "  "
			end,
			style = function(buffer)
				return buffer.is_focused and "bold" or nil
			end,
		},
		{
			text = "",
			delete_buffer_on_left_click = true,
		},
		{
			text = "",
			fg = function(buffer)
				return buffer.is_focused and get_hex("Visual", "bg") or get_hex("Normal", "bg")
			end,
			bg = get_hex("Normal", "bg"),
		},
	},
})
