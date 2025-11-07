return {
  "nvim-mini/mini.nvim",

  lazy = false,
  enabled = true,
  dependencies = {
    -- {
    --   "vimpostor/vim-tpipeline",
    -- },
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
  },
  config = function()
    if vim.g.colorschema == "mini" then
      vim.cmd("colorscheme randomhue")
      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
    end

    require("mini.extra").setup()

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
        action = "e ~/projects/snippets/package.json",
        section = "Nvim",
      },
      {
        name = "Obsidian: AuraKomputer",
        action = "e ~/Documents/Obsidian/AuraKomputer/",
        section = "Nvim",
      },
      {
        name = "Obsidian: Personal",
        action = "e ~/Documents/Obsidian/Personal/",
        section = "Nvim",
      },
      {
        name = "Obsidian: Reksa",
        action = "e ~/Documents/Obsidian/Reksa",
        section = "Nvim",
      },
    }

    -- notify
    local win_config = function()
      local has_statusline = vim.o.laststatus > 0
      local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
      return { anchor = "SE", col = vim.o.columns, row = vim.o.lines - pad }
    end
    require("mini.notify").setup({ window = { config = win_config } })
    local opts = { ERROR = { duration = 10000 } }
    vim.notify = require("mini.notify").make_notify({})

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
    local footer_n_seconds = (function()
      local timer = vim.loop.new_timer()
      local n_seconds = 0
      timer:start(
        0,
        1000,
        vim.schedule_wrap(function()
          if vim.bo.filetype ~= "ministarter" then
            timer:stop()
            return
          end
          n_seconds = n_seconds + 1
          MiniStarter.refresh()
        end)
      )

      return function()
        return "Selamat menjalankan hari ini, jangan lupa untuk tetap semangat : " .. n_seconds
      end
    end)()
    starter.setup({
      autoopen = true,
      header = table.concat(header_ascii, "\n"),
      footer = footer_n_seconds,
      evaluate_single = true,
      items = {
        my_items,
        starter.sections.sessions(5, true),
        starter.sections.builtin_actions(),
        starter.sections.recent_files(10, false),
        -- starter.sections.recent_files(10, true),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.aligning("center", "center"),
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
      use_icons = false,
      content = {
        active = function()
          local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
          local git = MiniStatusline.section_git({ trunc_width = 75 })
          local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
          -- local filename = MiniStatusline.section_filename({ trunc_width = 120 })
          local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
          local location = MiniStatusline.section_location({ trunc_width = 75 })
          local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

          local function macro_recording_status()
            local register = vim.fn.reg_recording()
            return register == "" and "" or "RECORDING @" .. register
          end

          local function filename()
            if vim.bo.buftype == "terminal" then
              return "%t"
            else
              return "%f%m%r"
            end
          end

          -- local navic = require("nvim-navic")

          -- print(mode_hl)
          return MiniStatusline.combine_groups({
            {
              hl = mode_hl,
              strings = {
                mode,
                macro_recording_status(),
                search,
                -- require("recorder").recordingStatus(),
                -- require("recorder").displaySlots(),
              },
            },
            "%<", -- Mark general truncate point
            {
              hl = "MiniStatuslineFilename",
              strings = {
                filename(),
              },
            },
            "%=", -- End left alignment
            {
              strings = {
                -- navic.get_location(),
                diagnostics,
                fileinfo,
                location
              },
            },
          })
        end,
        inactive = function()
          return "%F %m" -- Show full path and modified status for inactive windows
        end,
      },
    })
    -- }}} statusline

    require("mini.basics").setup({
      options = {
        basic = true,
        extra_ui = true,
        win_borders = "single",
        move_with_alt = true,
      },
      autocommands = {
        relnum_in_visual_mode = false,
      },
    })

    require("mini.diff").setup({
      -- source = require("mini.diff").gen_source.none(),
      view = {
        style = "number",
        signs = { add = "+", change = "~", delete = "-" },
        -- style = "sign",
        -- signs = { add = " ", change = " ", delete = "" },
      },
    })

    require("mini.tabline").setup({
      format = function(buf_id, label)
        local suffix = vim.bo[buf_id].modified and "+ " or ""
        return require("mini.tabline").default_format(buf_id, label) .. suffix
      end,
    })

    -- if vim.g.snack_enable == false then
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
    -- end

    require("mini.splitjoin").setup()
    require("mini.surround").setup()
    require("mini.git").setup()

    if vim.g.snack_enable == false or vim.g.explorer == "mini.files" then
      -- files {{{
      local MiniFiles = require("mini.files")
      -- require("functions.mini-files-git")

      MiniFiles.setup({
        use_as_default_explorer = true,
        content = {
          filter = function(fs_entry)
            return true
          end,
          prefix = function() end, -- disable icon in mini.files,
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
      --
      vim.keymap.set("n", "<C-n>", minifiles_toggle, { desc = "Toggle File Explorer" })
      --
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          local open_in_window_picker = function()
            local fs_entry = MiniFiles.get_fs_entry()
            if fs_entry ~= nil and fs_entry.fs_type == "file" then
              local picked_window_id

              if vim.g.snack_enable then
                picked_window_id = require("snacks.picker.util").pick_win()
              else
                picked_window_id = require("window-picker").pick_window()
              end

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
          vim.wo[win_id].winblend = 10
          local config = vim.api.nvim_win_get_config(win_id)
          config.border, config.title_pos = "single", "right"
          vim.api.nvim_win_set_config(win_id, config)
        end,
      })
      -- }}} files
    end
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

    require("mini.pairs").setup()
    -- require("mini.icons").setup()
    -- require("mini.icons").mock_nvim_web_devicons()
    require("mini.bufremove").setup({
      set_vim_settings = true,
    })
    require("mini.comment").setup()
    require("mini.bracketed").setup()

    -- pick {{{
    local MiniPick = require("mini.pick")
    MiniPick.setup({
      window = {
        config = function()
          height = math.floor(0.618 * vim.o.lines)
          width = math.floor(0.618 * vim.o.columns)
          return {
            border = "single",
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
    -- vim.keymap.set("n", "<leader>xx", ":Pick diagnostic<CR>", { desc = "Get List diagnostics" })
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
    if vim.g.completion == "mini" then
      require("mini.completion").setup({
        window = {
          info = { height = 30, width = 80, border = "double" },
          signature = { height = 30, width = 80, border = "double" },
        },
        lsp_completion = {
          auto_setup = true,
        },
        -- snippet_insert = function()
        --   if vim.g.snippets == "luasnip" then
        --     require("luasnip").expand_or_jumpable()
        --   end
        --
        --   if vim.g.snippets == "mini" then
        --     require("mini.snippets").expand()
        --   end
        --
        --   local suggestion = require("supermaven-nvim.completion_preview")
        --   if suggestion.has_suggestion() then
        --     suggestion.on_accept_suggestion()
        --   end
        -- end,
      })

      require("mini.icons").tweak_lsp_kind()

      local keycode = vim.keycode
          or function(x)
            return vim.api.nvim_replace_termcodes(x, true, true, true)
          end
      local keys = {
        ["cr"] = keycode("<CR>"),
        ["ctrl-y"] = keycode("<C-y>"),
        ["ctrl-y_cr"] = keycode("<C-y><CR>"),
        ["ctrl-n"] = keycode("<C-n>"),
      }

      _G.cr_action = function()
        if vim.fn.pumvisible() ~= 0 then
          local item_selected = vim.fn.complete_info()["selected"] ~= -1
          if item_selected then
            return keys["ctrl-y"] or keys["ctrl-y_cr"]
          else
            -- jika tidak ada item yang di pilih namun menampilkan pop up maka pilih item pertama
            return keys["ctrl-n"]
          end
        else
          return require("mini.pairs").cr()
        end
      end

      vim.keymap.set("i", "<CR>", "v:lua._G.cr_action()", { expr = true })
      vim.keymap.set("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
      vim.keymap.set("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
      vim.keymap.set("i", "<C-j>", [[pumvisible() ? "\<C-n>" : "\<C-j>"]], { expr = true })
      vim.keymap.set("i", "<C-k>", [[pumvisible() ? "\<C-p>" : "\<C-k>"]], { expr = true })
    end
    -- }}} end mini.completion

    -- {{{ mini snippets
    if vim.g.snippets == "mini" then
      local gen_loader = require("mini.snippets").gen_loader

      require("mini.snippets").setup({
        snippets = {
          gen_loader.from_lang(),
          -- gen_loader.from_runtime
        },
        mappings = {
          expand = "<C-A-Space>",
          jump_next = "<C-l>",
          jump_prev = "<C-h>",
          stop = "<C-c>",
        },

        expand = {
          insert = function(snippet, _)
            vim.snippet.expand(snippet.body)
          end,
        },
      })

      local jump_next = function()
        if vim.snippet.active({ direction = 1 }) then
          return vim.snippet.jump(1)
        end
      end
      local jump_prev = function()
        if vim.snippet.active({ direction = -1 }) then
          vim.snippet.jump(-1)
        end
      end
      vim.keymap.set({ "i", "s" }, "<C-l>", jump_next)
      vim.keymap.set({ "i", "s" }, "<C-h>", jump_prev)

      vim.api.nvim_create_autocmd({ "LspAttach" }, {
        callback = function()
          require("mini.snippets").start_lsp_server()
        end,
        desc = "Start snippets as LSP Server",
      })
    end

    -- }}}
  end,
}
