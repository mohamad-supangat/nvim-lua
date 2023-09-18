local my_items = {
    { name = "Open FZF file finder",   action = "FzfLua files",                           section = "Builtin actions" },
    { name = "Open nvim tree",         action = "NvimTreeOpen",                           section = "Builtin actions" },
    { name = "Config: init.lua",       action = "e ~/.config/nvim/init.lua",              section = "Nvim" },
    { name = "Snippets: package.json", action = "e ~/.config/nvim/snippets/package.json", section = "Nvim" },
}

local starter = require("mini.starter")
starter.setup({
    autoopen = true,
    evaluate_single = true,
    items = {
        my_items,
        -- starter.sections.sessions(5, true), -- starter.sections.telescope(),
        starter.sections.builtin_actions(),
        starter.sections.recent_files(10, false),
        starter.sections.recent_files(10, true),
        -- Use this if you set up 'mini.sessions'
    },
    content_hooks = {
        starter.gen_hook.adding_bullet(),
        -- starter.gen_hook.aligning("center", "center"),
        starter.gen_hook.indexing("all", { "Builtin actions" }),
        starter.gen_hook.padding(10, 0),
    },
})


-- remove gui window separator for using global statusline
-- vim.cmd([[hi WinSeparator guibg=none]])
MiniStatusline = require("mini.statusline")
MiniStatusline.setup({
    set_vim_settings = false,
    context = {
        active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local git = MiniStatusline.section_git({ trunc_width = 75 })
            local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            local filename = MiniStatusline.section_filename({ trunc_width = 140 })
            local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local location = MiniStatusline.section_location({ trunc_width = 75 })
            return MiniStatusline.combine_groups({
                { hl = mode_hl,                 strings = { mode } },
                { hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
                "%<", -- Mark general truncate point
                { hl = "MiniStatuslineFilename", strings = { filename } },
                "%=", -- End left alignment
                { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                { hl = mode_hl,                  strings = { location } },
            })
        end,
    },
})

-- require("mini.files").setup()
require("mini.splitjoin").setup()
require("mini.tabline").setup()
-- require('mini.pairs').setup()
require("mini.surround").setup()
require("mini.bufremove").setup({ set_vim_settings = true })
-- require("mini.cursorword").setup()
