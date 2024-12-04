return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    enabled = false,
    priority = 1000, -- needs to be loaded in first
    config = function()
        require('tiny-inline-diagnostic').setup({
            preset = 'modern',
            options = {
                softwrap = 30,
                show_all_diags_on_cursorline = true,
            }
        })
    end
}
