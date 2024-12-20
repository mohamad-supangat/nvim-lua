return {
    "folke/snacks.nvim",
    enabled = true,
    priority = 1000,
    lazy = false,
    opts = {
        zen = {},
        bigfile = { enabled = true },
        dashboard = { enabled = false },
        dim = {
            enabled = true,
        },
        indent = {
            enabled = true,
            scope = {
                animate = {
                    enabled = false
                },
            },
            chunk = {
                enabled = true,
                animate = {
                    enabled = false
                },
            }
            -- char = "│",
            -- blank = " ",
        },
        input = { enabled = true },
        notifier = {
            enabled = false,
            timeout = 3000,
        },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        styles = {
            notification = {
                wo = { wrap = true },
            },
        },
        lazygit = {
            configure = true,
        }
    },
    keys = {
        {
            "<leader>un",
            function()
                Snacks.notifier.hide()
            end,
            desc = "Dismiss All Notifications",
        },
        {
            "<leader>bd",
            function()
                Snacks.bufdelete()
            end,
            desc = "Delete Buffer",
        },
        {
            "<leader>gi",
            function()
                Snacks.lazygit({ cwd = require("utils").currentFileRootPath() })
            end,
            desc = "Open Lazygit",
        },
        {
            "<leader>gb",
            function()
                Snacks.git.blame_line()
            end,
            desc = "Git Blame Line",
        },
        {
            "<leader>gB",
            function()
                Snacks.gitbrowse()
            end,
            desc = "Git Browse",
        },
        {
            "<leader>gf",
            function()
                Snacks.lazygit.log_file()
            end,
            desc = "Lazygit Current File History",
        },
        {
            "<leader>gl",
            function()
                Snacks.lazygit.log()
            end,
            desc = "Lazygit Log (cwd)",
        },
        {
            "<leader>cR",
            function()
                Snacks.rename.rename_file()
            end,
            desc = "Rename File",
        },
        -- {
        --     "<c-/>",
        --     function()
        --         Snacks.terminal()
        --     end,
        --     desc = "Toggle Terminal",
        -- },
        -- {
        --     "<c-_>",
        --     function()
        --         Snacks.terminal()
        --     end,
        --     desc = "which_key_ignore",
        -- },
        -- {
        --     "]]",
        --     function()
        --         Snacks.words.jump(vim.v.count1)
        --     end,
        --     desc = "Next Reference",
        --     mode = { "n", "t" },
        -- },
        -- {
        --     "[[",
        --     function()
        --         Snacks.words.jump(-vim.v.count1)
        --     end,
        --     desc = "Prev Reference",
        --     mode = { "n", "t" },
        -- },
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.bt = function()
                    Snacks.debug.backtrace()
                end
                vim.print = _G.dd -- Override print to use snacks for `:=` command

                -- Create some toggle mappings
                Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
                Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
                Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                Snacks.toggle.diagnostics():map("<leader>ud")
                Snacks.toggle.line_number():map("<leader>ul")
                Snacks.toggle
                    .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
                    :map("<leader>uc")
                Snacks.toggle.treesitter():map("<leader>uT")
                Snacks.toggle
                    .option("background", { off = "light", on = "dark", name = "Dark Background" })
                    :map("<leader>ub")
                Snacks.toggle.inlay_hints():map("<leader>uh")
                Snacks.toggle.indent():map("<leader>ug")
                Snacks.toggle.dim():map("<leader>uD")
            end,
        })
    end,
}
