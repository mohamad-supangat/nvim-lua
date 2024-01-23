return {
    "potamides/pantran.nvim",
    -- enabled = false,
    config = function()
        local opts = { noremap = true, silent = true, expr = true }
        local pantran = require("pantran")
        local actions = require("pantran.ui.actions")
        local engines = require("pantran.engines")
        local async = require("pantran.async")
        pantran.setup({
            -- default_engine = "deepl",
            command = {
                default_mode = 'replace'
            },
            engines = {
                deepl = {
                    -- k
                }
            }
        })
        vim.keymap.set("n", "<leader>tr", pantran.motion_translate, opts)
        vim.keymap.set("n", "<leader>trr", function() return pantran.motion_translate() .. "_" end, opts)
        vim.keymap.set("x", "<leader>tr", pantran.motion_translate, opts)
    end
}
