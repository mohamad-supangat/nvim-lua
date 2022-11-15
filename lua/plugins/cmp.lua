--[[--
/home/deve/.config/nvim/lua/plugins/cmp.lua
Copyright (c) 2022 Mohamad Supangat <moha.supangat@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]
--
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local lspkind = require("lspkind")
cmp.setup({
	view = {
		entries = "custom",
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},

	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. strings[1] .. " "
			kind.menu = "    (" .. strings[2] .. ")"

			return kind
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "cmp-tw2css" },
	},
	confirm_opts = { behavior = cmp.ConfirmBehavior.Replace, select = false },
	window = {
		-- completion = {
		-- 	winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:Pmenu",
		-- 	col_offset = -3,
		-- 	side_padding = 0,
		-- },

		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	experimental = { ghost_text = true },
})

-- local cmp_h = {
-- 	PmenuSel = { bg = "#FF0000", fg = "NONE" },
-- 	Pmenu = { fg = "#C5CDD9", bg = "#22252A" },
--
-- 	CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", fmt = "strikethrough" },
-- 	CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", fmt = "bold" },
-- 	CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", fmt = "bold" },
-- 	CmpItemMenu = { fg = "#C792EA", bg = "NONE", fmt = "italic" },
--
-- 	CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
-- 	CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
-- 	CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },
--
-- 	CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
-- 	CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" },
-- 	CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" },
--
-- 	CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
-- 	CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
-- 	CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },
--
-- 	CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
-- 	CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
-- 	CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
-- 	CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
-- 	CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },
--
-- 	CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
-- 	CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },
--
-- 	CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
-- 	CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
-- 	CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },
--
-- 	CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
-- 	CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
-- 	CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },
--
-- 	CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
-- 	CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
-- 	CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
-- }
--
-- for key, value in pairs(cmp_h) do
-- 	vim.api.nvim_set_hl(0, key, { fg = value.fg, bg = value.bg })
-- end
