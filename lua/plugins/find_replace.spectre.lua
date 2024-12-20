return {
    "windwp/nvim-spectre",
    enabled = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cmd = "Spectre",
    keys = {
        {
            "<leader>S",
            '<cmd>lua require("spectre").toggle()<CR>',
            desc = "Toggle Spectre",
        },
        {
            "<leader>sw",
            '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
            desc = "Search current word",
        },
        {
            "<leader>sw",
            '<esc><cmd>lua require("spectre").open_visual()<CR>',
            mode = "v",
            desc = "Search current word",
        },
        {
            "<leader>sp",
            '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
            desc = "Search on current file",
        },
        {
            "<leader>sf",
            function()
                local currentFilePath = vim.api.nvim_buf_get_name(0)
                local currentFileDirectory, fileName = string.match(currentFilePath, "(.*/)(.*)")
                require("spectre").open({
                    is_insert_mode = true,
                    cwd = currentFileDirectory,
                    is_close = false, -- close an exists instance of spectre and open new
                })
            end,
            desc = "Toggle Spectre Curenf Folder",
        },
    },
    opts = {
        find_engine = {
            ["rg"] = {
                cmd = "rg",
                -- default args
                args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    -- "-uu",
                    -- "-g '!/**/.git'",
                    -- "-g '!/**/cache*/'",
                    -- "-g '!/**/node_modules'",
                    -- "-g '!/vendor'",
                    -- "-g '!*.{jpg,jpeg,png,gif,bmp,tiff,mov,mp4,avi,mpeg,webm}'"
                },
                options = {
                    ["ignore-case"] = {
                        value = "--ignore-case",
                        icon = "[I]",
                        desc = "ignore case",
                    },
                    ["hidden"] = {
                        value = "--hidden",
                        desc = "hidden file",
                        icon = "[H]",
                    },

                    ["no-ignore"] = {
                        value = "--no-ignore",
                        desc = "Don't respect ignore files",
                        icon = "[N-I]",
                    },
                    -- you can put any rg search option you want here it can toggle with
                    -- show_option function
                },
            },
        },
        default = {
            find = {
                --pick one of item in find_engine
                cmd = "rg",
                options = { "no-ignore" },
            },
        },
    },
}
