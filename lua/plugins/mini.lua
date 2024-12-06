return {
    "echasnovski/mini.nvim",
    lazy = false,
    enabled = true,
    dependencies = {
        "SmiteshP/nvim-navic",
        {
            "s1n7ax/nvim-window-picker",
            name = "window-picker",
            event = "VeryLazy",
            version = "2.*",
            config = function()
                require("window-picker").setup({
                    hint = "floating-big-letter",
                    autoselect_one = true,
                    include_current = false,
                    selection_chars = "ABCDEFGHIJLK",
                    filter_rules = {
                        bo = {
                            filetype = { "neo-tree", "neo-tree-popup", "notify", "minifiles" },
                            buftype = { "terminal", "quickfix", "minifiles" },
                        },
                    },
                    other_win_hl_color = "#900000",
                })
            end,
        },
        -- {
        --     "benlubas/cmp2lsp",
        --     dependencies = {
        --         {
        --             "L3MON4D3/LuaSnip",
        --             dev = false,
        --             config = function()
        --                 require("luasnip.loaders.from_vscode").lazy_load({ paths = { "/home/deve/projects/snippets" } })
        --                 require("luasnip.loaders.from_vscode").lazy_load()
        --             end,
        --         },
        --         "saadparwaiz1/cmp_luasnip",
        --         "hrsh7th/cmp-path",
        --         "hrsh7th/cmp-buffer",
        --         -- {
        --         --     "Exafunction/codeium.nvim",
        --         --     enabled = true,
        --         --     opts = {
        --         --         enable_cmp_source = false,
        --         --         -- enable_chat = true,
        --         --     },
        --         -- },
        --     },
        --     config = vim.schedule_wrap(function()
        --         require("cmp2lsp").setup({
        --             sources = { { "codeium", "luasnip", "path", "buffer" } },
        --         })
        --     end),
        -- },
    },
    config = function()
        vim.o.background = os.getenv("NVIM_BACKGROUND") or "light"

        local hues = require("mini.hues")
        local base_colors = hues.gen_random_base_colors()
        print(require("mini.hues").gen_random_base_colors())
        hues.setup({
            background = base_colors.background,
            foreground = base_colors.foreground,
            -- background = "#FAFAFA",
            -- foreground = "#383A42",
            n_hues = 8,
            saturation = "low",
            saturation = vim.o.background == "dark" and "medium" or "high",
            accent = "bg",
            use_cterm = true,
        })

        -- mini starter {{{
        local my_items = {
            -- { name = "Open FZF file finder",   action = "FzfLua files",                           section = "Builtin actions" },
            -- { name = "Open nvim tree",         action = "NvimTreeOpen",                           section = "Builtin actions" },
            {
                name = "Config: init.lua",
                action = "e ~/.config/nvim/init.lua",
                section = "Nvim",
            },
            {
                name = "Snippets: package.json",
                action = "e ~/.config/nvim/snippets/package.json",
                section = "Nvim",
            },
        }

        -- mini sesssion
        require("mini.sessions").setup({
            directory = "/home/deve/.local/state/nvim/sessions/",
        })

        local header_ascii = {
            "           ▄ ▄                   ",
            "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
            "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
            "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
            "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
            "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
            "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
            "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
            "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
        }

        local starter = require("mini.starter")
        starter.setup({
            autoopen = true,
            header = table.concat(header_ascii, "\n"),
            footer = "Selamat menjalankan hari ini, jangan lupa untuk tetap semangat",
            evaluate_single = true,
            items = {
                my_items,
                starter.sections.sessions(5, true),
                starter.sections.builtin_actions(),
                starter.sections.recent_files(10, false),
                -- starter.sections.recent_files(10, true),
            },
            content_hooks = {
                -- starter.gen_hook.adding_bullet(),
                -- starter.gen_hook.aligning("center", "center"),
                starter.gen_hook.indexing("all", { "Builtin actions" }),
                starter.gen_hook.padding(10, 0),
            },
        })
        -- }}} end mini starter

        -- statusline {{{
        vim.opt.laststatus = 3
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

                    local function macro_recording_status()
                        local register = vim.fn.reg_recording()
                        return register == "" and "" or "RECORDING @" .. register
                    end

                    local navic = require("nvim-navic")

                    -- local current_gps = gps.get_location()

                    -- print(mode_hl)
                    return MiniStatusline.combine_groups({
                        {
                            hl = mode_hl,
                            strings = { mode, macro_recording_status() },
                        },
                        "%<", -- Mark general truncate point
                        {
                            hl = "MiniStatuslineFilename",
                            strings = {
                                filename,
                                vim.g.coc_status,
                            },
                        },
                        "%=", -- End left alignment
                        { hl = "MiniStatuslineFileinfo", strings = { navic.get_location() } },

                        -- { hl = "MiniStatuslineFileinfo", strings = { diagnostics, fileinfo } },
                        -- { hl = mode_hl,                  strings = { location } },
                    })
                end,
            },
        })
        -- }}} statusline

        require("mini.basics").setup({
            options = {
                extra_ui = true,
                win_borders = "rounded",
            },
        })

        require("mini.diff").setup({
            view = {
                style = "number",
                -- signs = { add = "+", change = "~", delete = "-" },
                --
                -- style = "sign",
                signs = { add = " ", change = " ", delete = "" },
            },
        })

        require("mini.tabline").setup({
            -- format = function(buf_id, label)
            --     local suffix = vim.bo[buf_id].modified and "+ " or ""
            --     return require("mini.tabline").default_format(buf_id, label) .. suffix
            -- end,
        })

        require("mini.splitjoin").setup()
        require("mini.surround").setup()
        require("mini.git").setup()

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

        -- files {{{
        local MiniFiles = require("mini.files")
        require("functions.mini-files-git")

        MiniFiles.setup({
            use_as_default_explorer = true,
            content = {
                filter = function(fs_entry)
                    return true
                end,
                -- prefix = function()
                --
                -- end
            },
            width_focus = 30,
            width_nofocus = 20,
            width_preview = 25,
            mappings = {
                go_in = "L",
                go_in_plus = "l",
                go_out = "H",
                go_out_plus = "h",
            },
        })

        -- toggle file explorer
        local minifiles_toggle = function()
            if not MiniFiles.close() then
                MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
                MiniFiles.reveal_cwd()
            end
        end

        vim.keymap.set("n", "<C-n>", minifiles_toggle, { desc = "Toggle File Explorer" })

        vim.api.nvim_create_autocmd("User", {
            pattern = "MiniFilesBufferCreate",
            callback = function(args)
                local buf_id = args.data.buf_id
                local open_in_window_picker = function()
                    local fs_entry = MiniFiles.get_fs_entry()
                    if fs_entry ~= nil and fs_entry.fs_type == "file" then
                        local picked_window_id = require("window-picker").pick_window()
                        if picked_window_id ~= nil then
                            MiniFiles.set_target_window(picked_window_id)
                        end
                    end
                    MiniFiles.go_in({
                        close_on_file = true,
                    })
                end
                vim.keymap.set("n", "l", open_in_window_picker, { buffer = buf_id, desc = "Open in target window" })
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "MiniFilesWindowOpen",
            callback = function(args)
                local win_id = args.data.win_id

                -- Customize window-local settings
                -- vim.wo[win_id].winblend = 50
                local config = vim.api.nvim_win_get_config(win_id)
                config.border, config.title_pos = "rounded", "right"
                vim.api.nvim_win_set_config(win_id, config)
            end,
        })
        -- }}} files
        -- hl patttern {{{
        local hipatterns = require("mini.hipatterns")
        hipatterns.setup({
            highlighters = {
                -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
                hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
                todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
                note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

                -- Highlight hex color strings (`#rrggbb`) using that color
                hex_color = hipatterns.gen_highlighter.hex_color(),
            },
        })
        -- }}} hl pattern
        -- clue {{{
        local miniclue = require("mini.clue")
        miniclue.setup({
            triggers = {
                { mode = "n", keys = "<Leader>" },
                { mode = "x", keys = "<Leader>" },
                { mode = "n", keys = "[" },
                { mode = "n", keys = "]" },
                { mode = "x", keys = "s" },
                { mode = "n", keys = "s" },

                -- `g` key
                { mode = "n", keys = "g" },
                { mode = "x", keys = "g" },

                -- Marks
                { mode = "n", keys = "'" },
                { mode = "n", keys = "`" },
                { mode = "x", keys = "'" },
                { mode = "x", keys = "`" },

                -- Registers
                { mode = "n", keys = '"' },
                { mode = "x", keys = '"' },
                { mode = "i", keys = "<C-r>" },
                { mode = "c", keys = "<C-r>" },

                -- Window commands
                { mode = "n", keys = "<C-w>" },

                -- `z` key
                { mode = "n", keys = "z" },
                { mode = "x", keys = "z" },
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
        -- }}} clue

        require("mini.icons").setup()
        require("mini.icons").mock_nvim_web_devicons()
        require("mini.bufremove").setup({
            set_vim_settings = true,
        })
        require("mini.comment").setup({
            options = {
                custom_commentstring = function()
                    return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
                end,
            },
        })
        require("mini.bracketed").setup()
        require("mini.bracketed").setup()

        -- pick {{{
        local MiniPick = require("mini.pick")
        MiniPick.setup({
            window = {
                config = function()
                    height = math.floor(0.618 * vim.o.lines)
                    width = math.floor(0.618 * vim.o.columns)
                    return {
                        border = "rounded",
                        anchor = "NW",
                        height = height,
                        width = width,
                        row = math.floor(0.5 * (vim.o.lines - height)),
                        col = math.floor(0.5 * (vim.o.columns - width)),
                    }
                end,
            },
            mappings = {
                delete_word = "<A-BS>",
                move_down = "<C-j>",
                move_up = "<C-k>",
            },
        })

        vim.ui.select = MiniPick.ui_select

        -- Picker pre- and post-hooks ===============================================

        -- Keys should be a picker source.name. Value is a callback function that
        -- accepts same arguments as User autocommand callback.
        local pre_hooks = {}
        local post_hooks = {}

        local group = vim.api.nvim_create_augroup("minipick-hooks", { clear = true })
        local create_minipick_auto_command = function(pattern, desc, hooks)
            vim.api.nvim_create_autocmd({ "User" }, {
                pattern = pattern,
                group = group,
                desc = desc,
                callback = function(...)
                    local opts = MiniPick.get_picker_opts()
                    if opts and opts.source then
                        local hook = hooks[opts.source.name] or function(...) end
                        hook(...)
                    end
                end,
            })
        end
        create_minipick_auto_command("MiniPickStart", "pre-hook for source.name", pre_hooks)
        create_minipick_auto_command("MiniPickStop", "post-hook for source.name", post_hooks)

        -- colorscheme picker
        -- best Customize from
        -- https://github.com/pkazmier/nvim/blob/main/lua/plugins/mini/pick.lua
        local selected_colorscheme -- Currently selected or original colorscheme

        pre_hooks.Colorschemes = function()
            selected_colorscheme = vim.g.colors_name
        end

        post_hooks.Colorschemes = function()
            vim.schedule(function()
                vim.cmd("colorscheme " .. selected_colorscheme)
            end)
        end

        MiniPick.registry.colorschemes = function()
            local colorschemes = vim.fn.getcompletion("", "color")
            return MiniPick.start({
                source = {
                    name = "Colorschemes",
                    items = colorschemes,
                    choose = function(item)
                        selected_colorscheme = item
                    end,
                    preview = function(buf_id, item)
                        vim.cmd("colorscheme " .. item)
                        vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, { item })
                    end,
                },
            })
        end
        vim.keymap.set("", "<C-p>", function()
            MiniPick.builtin.cli({
                command = {
                    "rg",
                    "--files",
                    "--hidden",
                    "-uu",
                    "-g",
                    "!/**/.git",
                    "-g",
                    "!/**/node_modules",
                    "-g",
                    "!/vendor",
                    "-g",
                    "!/public/build",
                    "-g",
                    "!*.{jpg,jpeg,png,gif,bmp,tiff,mov,mp4,avi,mpeg,webm,pdf,doc,docx,mp3,cache,gitkeep,gitignore}",
                },
            })
        end, { desc = "Pick file with Rg" })
        vim.keymap.set("n", "<leader>P", ":Pick commands<CR>", { desc = "Pick command" })
        vim.keymap.set("n", "<leader>xx", ":Pick diagnostic<CR>", { desc = "Get List diagnostics" })
        -- vim.keymap.set("n", "<leader>m", ":Pick buffers<CR>")
        vim.keymap.set("n", "<leader>B", ":Pick buffers<CR>", { desc = "Pick buffer" })

        -- }}} pick
        -- minimap {{{
        local MiniMap = require("mini.map")
        MiniMap.setup({
            integrations = {
                MiniMap.gen_integration.builtin_search(),
                MiniMap.gen_integration.diff(),
                MiniMap.gen_integration.diagnostic(),
            },
            symbols = {
                encode = MiniMap.gen_encode_symbols.dot("4x2"),
            },
        })

        vim.keymap.set("n", "<Leader>mf", MiniMap.toggle_focus, { desc = "Toggle MiniMap Focus" })
        vim.keymap.set("n", "<Leader>mr", MiniMap.refresh, { desc = "Refresh MiniMap" })
        vim.keymap.set("n", "<Leader>ms", MiniMap.toggle_side, { desc = "Toggle MiniMap Side" })
        vim.keymap.set("n", "<Leader>mt", MiniMap.toggle, { desc = "Toggle MiniMap" })
        -- }}} minimap

        -- {{{ mini.completion
        -- require("mini.completion").setup({
        --     window = {
        --         info = { height = 30, width = 80, border = "double" },
        --         signature = { height = 30, width = 80, border = "double" },
        --     },
        -- })
        --
        -- require("mini.icons").tweak_lsp_kind()
        --
        -- local keycode = vim.keycode
        --     or function(x)
        --         return vim.api.nvim_replace_termcodes(x, true, true, true)
        --     end
        -- local keys = {
        --     ["cr"] = keycode("<CR>"),
        --     ["ctrl-y"] = keycode("<C-y>"),
        --     ["ctrl-y_cr"] = keycode("<C-y><CR>"),
        -- }
        --
        -- _G.cr_action = function()
        --     if vim.fn.pumvisible() ~= 0 then
        --         -- If popup is visible, confirm selected item or add new line otherwise
        --         local item_selected = vim.fn.complete_info()["selected"] ~= -1
        --         return item_selected and keys["ctrl-y"] or keys["ctrl-y_cr"]
        --     else
        --         -- If popup is not visible, use plain `<CR>`. You might want to customize
        --         -- according to other plugins. For example, to use 'mini.pairs', replace
        --         -- next line with `return require('mini.pairs').cr()`
        --         -- return keys['cr']
        --         return require("mini.pairs").cr()
        --     end
        -- end
        --
        -- vim.keymap.set("i", "<CR>", "v:lua._G.cr_action()", { expr = true })
        -- vim.keymap.set("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
        -- vim.keymap.set("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
        -- vim.keymap.set("i", "<C-j>", [[pumvisible() ? "\<C-n>" : "\<C-j>"]], { expr = true })
        -- vim.keymap.set("i", "<C-k>", [[pumvisible() ? "\<C-p>" : "\<C-k>"]], { expr = true })
        -- }}} end mini.completion
    end,
}
