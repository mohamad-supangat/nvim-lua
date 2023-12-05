return {
    "windwp/nvim-spectre",
    cmd = 'Spectre',
    config = function()
        local status_ok, spectre = pcall(require, "spectre")
        if not status_ok then
            return
        end


        vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
            desc = "Toggle Spectre"
        })
        vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
            desc = "Search current word"
        })
        vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
            desc = "Search current word"
        })
        vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
            desc = "Search on current file"
        })

        require('spectre').setup({
            find_engine = {
                ['rg'] = {
                    cmd = "rg",
                    -- default args
                    args = {
                        '--color=never',
                        '--no-heading',
                        '--with-filename',
                        '--line-number',
                        '--column',
                        -- "-uu",
                        -- "-g '!/**/.git'",
                        -- "-g '!/**/cache*/'",
                        -- "-g '!/**/node_modules'",
                        -- "-g '!/vendor'",
                        -- "-g '!*.{jpg,jpeg,png,gif,bmp,tiff,mov,mp4,avi,mpeg,webm}'"
                    },
                    options = {
                        ['ignore-case'] = {
                            value = "--ignore-case",
                            icon = "[I]",
                            desc = "ignore case"
                        },
                        ['hidden'] = {
                            value = "--hidden",
                            desc = "hidden file",
                            icon = "[H]"
                        },
                        -- you can put any rg search option you want here it can toggle with
                        -- show_option function
                    }
                },
            },
            default = {
                find = {
                    --pick one of item in find_engine
                    cmd = "rg",
                    options = {}
                },
            },
        })
    end
}
