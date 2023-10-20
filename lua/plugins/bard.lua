local status_ok, bard = pcall(require, "nvim-bard")
if not status_ok then
    return
end


local api = require("bard-api")

bard.setup({
    bard_api_key = api.bard_api_key,
    display_mode = "popup", -- "popup", "vsplit" or "tabnew"
    mappings = {
        toggle_bard = "<A-b>",
        hide_bard = { "q", "<esc>" },
        send_bard = "<cr>",
        new_chat = "<c-n>"
    },
    options = {
        ui = {
            question = {
                signs = {
                    sign = "",
                    hi = "Function",
                    style = "rounded"  -- "double", "none", "rounded", "solid"
                },
                border = {             -- only for "popup" mode
                    style = "double", -- "double", "none", "shadow", "rounded", "solid"
                    text = {
                        top = "Whats Propmt ?????"
                    }
                },
                winhighlight = "Normal:Normal,FloatBorder:Normal"
            },
            bard = {
                signs = {
                    sign = "=>",
                    hi = "Statement",
                    style = "double"
                },
                border = {
                    style = "double",
                    text = {
                        top = "[Bard]"
                    }
                },
                winhighlight = "Normal:Normal,FloatBorder:Normal"
            }
        },
        buffer_options = {
            signcolumn = 'yes:1',
            filetype = 'markdown',
            conceallevel = 3,
            buftype = "nofile",
        },
    }
})
