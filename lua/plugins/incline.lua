return {
    "b0o/incline.nvim",
    enabled = false,
    dependencies = {
        "SmiteshP/nvim-navic",
    },
    config = function()
        local helpers = require("incline.helpers")
        local navic = require("nvim-navic")
        local devicons = require("mini.icons")

        require("incline").setup({
            window = {
                padding = 0,
                margin = { horizontal = 0, vertical = 0 },
            },
            render = function(props)
                local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                if filename == "" then
                    filename = "[No Name]"
                end
                local modified = vim.bo[props.buf].modified
                local res = {
                    "",
                    " ",
                    -- { filename, gui = modified and "bold,italic" or "bold" },
                    guibg = "#44406e",
                }
                if props.focused then
                    for _, item in ipairs(navic.get_data(props.buf) or {}) do
                        table.insert(res, {
                            { " > ", group = "NavicSeparator" },
                            { item.icon, group = "NavicIcons" .. item.type },
                            { item.name, group = "NavicText" },
                        })
                    end
                end
                table.insert(res, " ")
                return res
            end,
        })
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
}
