return {
    "sainnhe/gruvbox-material",
    lazy = false,
    config = function()
        -- vim.cmd([[let g:gruvbox_material_transparent_background = 1]])
        vim.cmd([[set background=dark]])

        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_background = "hard"
        vim.g.gruvbox_material_better_performance = true
        vim.g.gruvbox_material_foreground = "material"

        vim.cmd([[colorscheme gruvbox-material]])
    end,
}
