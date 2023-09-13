-- Load the colorscheme
-- local status_ok = pcall(require, "everforest")
-- if not status_ok then
--     return
-- end


vim.g.gruvbox_material_enable_italic = 1
-- vim.g.gruvbox_material_dim_inactive_windows = 1
-- vim.g.gruvbox_material_diagnostic_text_highlight = 0
vim.g.gruvbox_material_transparent_background  = 1
-- vim.g.gruvbox_material_disable_italic_comment = 1
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_foreground = 'original'

vim.g.gruvbox_material_better_performance = 1
vim.cmd([[colorscheme gruvbox-material]])
