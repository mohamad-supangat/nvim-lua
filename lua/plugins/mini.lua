return {
    "echasnovski/mini.nvim",
    dependencies = {},
    config = function()
        -- require("mini.hues").setup({ background = "#000000", foreground = "#aaaaaa", accent = "cyan", use_cterm = true })
        --

        -- require("mini.base16").setup({
        --     palette = require("mini.base16").mini_palette("#000000", "#aaaaaa", 50),
        --     use_cterm = true,
        --     -- plugins = {
        --     --     default = true,
        --     --     -- ["echasnovski/mini.nvim"] = true,
        --     -- },
        -- })
        -- vim.api.nvim_set_hl(0, "Comment", { italic = true, fg = "#85717f" })
        -- require('mini.colors').setup()

        local my_items = {
            -- { name = "Open FZF file finder",   action = "FzfLua files",                           section = "Builtin actions" },
            -- { name = "Open nvim tree",         action = "NvimTreeOpen",                           section = "Builtin actions" },
            { name = "Config: init.lua", action = "e ~/.config/nvim/init.lua", section = "Nvim" },
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
        vim.cmd([[hi WinSeparator guibg=none]])
        MiniStatusline = require("mini.statusline")
        MiniStatusline.setup({
            set_vim_settings = true,
            content = {
                active = function()
                    local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                    local git = MiniStatusline.section_git({ trunc_width = 75 })
                    local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
                    local filename = MiniStatusline.section_filename({ trunc_width = 140 })
                    local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
                    local location = MiniStatusline.section_location({ trunc_width = 75 })

                    -- local current_gps = gps.get_location()

                    return MiniStatusline.combine_groups({
                        { hl = mode_hl, strings = { mode } },
                        { hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
                        "%<", -- Mark general truncate point
                        {
                            hl = "MiniStatuslineFilename",
                            strings = {
                                filename,
                                vim.g.coc_status,
                            },
                        },
                        "%=", -- End left alignment
                        { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                        { hl = mode_hl, strings = { location } },
                    })
                end,
            },
        })

        require("mini.basics").setup({
            options = {
                extra_ui = true,
                win_borders = "rounded",
            },
        })

        -- {{ File explorer
        -- local MiniFiles = require("mini.files")
        -- MiniFiles.setup({ border = "rounded" })
        --
        -- -- toggle file explorer
        -- local minifiles_toggle = function(...)
        --     if not MiniFiles.close() then
        --         MiniFiles.open(...)
        --     end
        -- end
        --
        -- vim.keymap.set("n", "<C-n>", minifiles_toggle)
        -- }}

        -- require("mini.notify").setup()
        require("mini.splitjoin").setup()
        require("mini.tabline").setup()
        require("mini.diff").setup({
            view = {
                style = "number",
                signs = { add = "+", change = "~", delete = "-" },
            },
        })
        require("mini.git").setup()

        -- require('mini.pairs').setup()
        require("mini.surround").setup()
        require("mini.indentscope").setup({
            symbol = "▏",
            options = {
                try_as_border = true,
            },
            draw = {
                delay = 0,
                animation = require("mini.indentscope").gen_animation.none(),
            },
        })

        local miniclue = require("mini.clue")
        miniclue.setup({
            triggers = {
                { mode = "n", keys = "<Leader>" },
                { mode = "x", keys = "<Leader>" },
            },
            clues = {
                miniclue.gen_clues.builtin_completion(),
                miniclue.gen_clues.g(),
                miniclue.gen_clues.marks(),
                miniclue.gen_clues.registers(),
                miniclue.gen_clues.windows(),
                miniclue.gen_clues.z(),
            },
        })
        require("mini.bufremove").setup({ set_vim_settings = true })
        require("mini.comment").setup({
            options = {
                custom_commentstring = function()
                    return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
                end,
            },
        })
        -- require("mini.cursorword").setup()
        -- require('mini.animate').setup({
        --     scroll = {
        --         enable = false,
        --     },
        --     cursor = {
        --         timing = require('mini.animate').gen_timing.cubic({ duration = 50, unit = 'total' })
        --     },
        -- })
        -- require('mini.jump').setup()
        -- require('mini.jump2d').setup()
        require("mini.bracketed").setup()
        -- require('mini.move').setup()

        --- {{{ picker
        -- local MiniPick = require('mini.pick')
        --
        -- local win_config = function()
        --     height = math.floor(0.618 * vim.o.lines)
        --     width = math.floor(0.618 * vim.o.columns)
        --     return {
        --         border = 'rounded',
        --         anchor = 'NW',
        --         height = height,
        --         width = width,
        --         row = math.floor(0.5 * (vim.o.lines - height)),
        --         col = math.floor(0.5 * (vim.o.columns - width)),
        --     }
        -- end

        -- MiniPick.setup({
        --     window = { config = {} },
        --     mappings = {
        --         move_down = '<C-j>',
        --         move_up = '<C-k>'
        --     }
        -- })
        --
        -- require('mini.extra').setup()
        -- map("", "<C-p>", function()
        --     -- MiniPick.builtin.cli({ command = { "rg --files --ignore-case --hidden -uu -g '!/**/.git' -g '!/**/cache*/' -g '!/**/node_modules' -g '!/vendor' -g '!*.{jpg,jpeg,png,gif,bmp,tiff,mov,mp4,avi,mpeg,webm}'" } })
        --     MiniPick.builtin.files({ tool = 'rg' })
        -- end, default_opts)
        -- map("n", "<leader>P", ":Pick commands<CR>", default_opts)     -- open fzf menu
        -- map("n", "<leader>xx", ":Pick diagnostics<CR>", default_opts) -- open diagnostic aka trouble.nvim
        -- map("n", "<leader>xx", ":Pick buffers<CR>", default_opts)
        -- --}}}
    end,
}
