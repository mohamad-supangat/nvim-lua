return {
    "numToStr/FTerm.nvim",
    config = function()
        local status_ok, fterm = pcall(require, "FTerm")
        if not status_ok then
            return
        end

        local currentFileRootPath = require("utils").currentFileRootPath

        function _G.lazygit()
            local lazygit = fterm:new({
                cmd = "lazygit -p " .. currentFileRootPath(),
                -- blend = 20,
                border = "double",
                dimensions = {
                    height = 1,
                    width = 1,
                },
            })
            lazygit:toggle()
        end

        local bard = fterm:new({
            cmd = "gemini",
            -- blend = 20,
            border = "double",
            dimensions = {
                height = 1,
                width = 0.7,
            },
        })

        function _G.bard()
            bard:toggle()
        end

        local fterm1 = fterm:new({
            cmd = os.getenv("SHELL"),
            border = "double",
            -- blend = 20,
            dimensions = {
                height = 1,
                width = 0.8,
                x = 0,
            },
        })

        local fterm2 = fterm:new({
            cmd = os.getenv("SHELL"),
            border = "double",
            -- blend = 20,
            dimensions = {
                height = 1,
                width = 0.8,
                x = 1,
            },
        })

        function _G.fterm1()
            fterm1:toggle()
        end

        function _G.fterm2()
            fterm2:toggle()
        end

        -- keymaping
        local map = vim.api.nvim_set_keymap
        local default_opts = { noremap = true, silent = true }

        map("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', default_opts)
        map("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', default_opts)

        map("n", "<F1>", ":lua fterm1()<CR>", default_opts)
        map("t", "<F1>", "<C-\\><C-n><CMD>lua fterm1()<CR>", default_opts)
        map("n", "<F2>", ":lua fterm2()<CR>", default_opts)
        map("t", "<F2>", "<C-\\><C-n><CMD>lua fterm2()<CR>", default_opts)
        -- map("n", "<leader>gi", ":lua lazygit()<CR>", default_opts)
        --
        map("n", "<A-b>", ":lua bard()<CR>", default_opts)
        map("t", "<A-b>", "<C-\\><C-n><CMD>lua bard()<CR>", default_opts)
    end,
}
