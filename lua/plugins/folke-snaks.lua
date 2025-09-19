return {
  "folke/snacks.nvim",
  enabled = vim.g.snack_enable,
  priority = 1000,
  lazy = false,
  opts = {
    zen = {
      toggles = {
        dim = false,
        git_signs = false,
        mini_diff_signs = false,
        -- diagnostics = false,
        -- inlay_hints = false,
      },
    },
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    dim = {
      enabled = true,
    },
    scroll = {
      animate = {
        duration = { step = 15, total = 250 },
        easing = "linear",
      },
      animate_repeat = {
        delay = 100, -- delay in ms before using the repeat animation
        duration = { step = 5, total = 50 },
        easing = "linear",
      },
      filter = function(buf)
        return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and vim.bo[buf].buftype ~= "terminal"
      end,
    },
    explorer = {
      enabled = vim.g.explorer == "snack",
    },
    scope = {},
    indent = {
      enabled = true,
      scope = {
        enabled = true,
        animate = {
          enabled = false,
        },
      },
      chunk = {
        enabled = true,
        animate = {
          enabled = false,
        },
      },
      char = "│",
      blank = " ",
    },
    picker = {
      enabled = true,
      win = {
        keys = {
          i_del_word = { "<A-BS>", "", mode = "i", expr = true },
        },
        actions = {
          delete_word = function()
            return "<cmd>normal! diw<cr><right>"
          end,
        },
      },
      sources = {
        explorer = {
          enabled = vim.g.explorer == "snack",
          hidden = true,
          ignored = true,
          auto_close = true,
          win = {
            list = {
              keys = {
                ["l"] = { { "pick_win", "confirm" }, mode = { "n", "i" } },
              },
            },
          },
          layout = {
            layout = {
              box = "vertical",
              position = "left",
              width = 0.2,
              {
                win = "input",
                max_height = 1,
                height = 1,
                border = { "", "", "", "", "", "", "", " " },
                wo = {
                  winhighlight = "FloatBorder:Normal,NormalFloat:Normal,SnacksPickerPrompt:SnacksPickerPromptTransparent",
                },
              },
              {
                win = "list",
                border = "none",
                wo = {
                  winhighlight = "FloatBorder:Normal,NormalFloat:Normal",
                },
              },
            },
          },
        },
      },
    },
    input = {
      enabled = true,
      win = {
        b = {
          completion = true,
        },
        bo = {
          filetype = "snacks_input",
          buftype = "prompt",
        },
        height = 3,
        border = "rounded",
        -- https://github.com/folke/snacks.nvim/discussions/376
        keys = {
          i_del_word = { "<A-BS>", "delete_word", mode = "i", expr = true },
        },
        actions = {
          delete_word = function()
            return "<cmd>normal! diw<cr><right>"
          end,
        },
      },
    },
    notifier = {
      backdrop = true,
      enabled = true,
      timeout = 3000,
      top_down = false,
      style = "minimal",
    },
    quickfile = { enabled = true },
    statuscolumn = {
      left = { "mark", "sign" },
      right = { "fold", "git" },
      folds = {
        open = false, -- show open fold icons
        git_hl = false, -- use Git Signs hl for fold icons
      },
      git = {
        -- patterns to match Git signs
        patterns = { "GitSign", "MiniDiffSign" },
      },
      refresh = 50, -- refresh at most every 50ms
    },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true },
      },
      zen = {
        width = 0,
      },
    },
    lazygit = {
      configure = true,
    },
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
    {
      "<C-z>",
      function()
        Snacks.zen()
      end,
      desc = "Toggle Zen Mode",
    },
    {
      "<leader>do",
      function()
        Snacks.terminal("lazydocker")
      end,
      desc = "Toggle Lazydocker",
    },
    -- {
    --   mode = { "t", "n" },
    --   "<A-b>",
    --   function()
    --     Snacks.terminal.toggle("gemini")
    --   end,
    --   desc = "Toggle Gemini",
    -- },

    -- {
    --   mode = { "t", "n" },
    --   "<A-b>",
    --   function()
    --     Snacks.terminal.toggle(
    --       "aider --no-auto-commits --pretty --stream --model gemini/gemini-1.5-flash --chat-language id"
    --     )
    --   end,
    --   desc = "Toggle Aider",
    -- },
    --
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

    -- snack Picker
    -- Top Pickers & Explorer
    -- {
    --   "<leader><space>",
    --   function()
    --     Snacks.picker.smart()
    --   end,
    --   desc = "Smart Find Files",
    -- },
    {
      "<leader>,",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>/",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>nn",
      function()
        Snacks.picker.notifications()
      end,
      desc = "Notification History",
    },
    -- find
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>fc",
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Find Config File",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Find Git Files",
    },
    {
      "<leader>fp",
      function()
        Snacks.picker.projects()
      end,
      desc = "Projects",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent",
    },
    -- Grep
    {
      "<leader>sb",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sB",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Grep Open Buffers",
    },
    {
      "<leader>sg",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>sw",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Visual selection or word",
      mode = { "n", "x" },
    },
    -- search
    {
      '<leader>s"',
      function()
        Snacks.picker.registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>s/",
      function()
        Snacks.picker.search_history()
      end,
      desc = "Search History",
    },
    {
      "<leader>sa",
      function()
        Snacks.picker.autocmds()
      end,
      desc = "Autocmds",
    },
    {
      "<leader>sb",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sc",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>sC",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>sD",
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = "Buffer Diagnostics",
    },
    {
      "<leader>sh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
    },
    {
      "<leader>sH",
      function()
        Snacks.picker.highlights()
      end,
      desc = "Highlights",
    },
    {
      "<leader>si",
      function()
        Snacks.picker.icons()
      end,
      desc = "Icons",
    },
    {
      "<leader>sj",
      function()
        Snacks.picker.jumps()
      end,
      desc = "Jumps",
    },
    {
      "<leader>sk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>sl",
      function()
        Snacks.picker.loclist()
      end,
      desc = "Location List",
    },
    -- {
    --   "<leader>sm",
    --   function()
    --     Snacks.picker.marks()
    --   end,
    --   desc = "Marks",
    -- },
    -- {
    --   "<leader>sM",
    --   function()
    --     Snacks.picker.man()
    --   end,
    --   desc = "Man Pages",
    -- },
    {
      "<leader>sp",
      function()
        Snacks.picker.lazy()
      end,
      desc = "Search for Plugin Spec",
    },
    {
      "<leader>sq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "Quickfix List",
    },
    {
      "<leader>sR",
      function()
        Snacks.picker.resume()
      end,
      desc = "Resume",
    },
    {
      "<leader>su",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undo History",
    },
    {
      "<leader>uC",
      function()
        Snacks.picker.colorschemes()
      end,
      desc = "Colorschemes",
    },
    -- LSP
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "gD",
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = "Goto Declaration",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
    },
    {
      "gy",
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto T[y]pe Definition",
    },
    {
      "<leader>ss",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    {
      "<leader>sS",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
    },

    -- Some keymaps
    {
      "<A-BS>",
      "<C-W>",
    },
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
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")

        if vim.g.explorer == "snack" then
          vim.keymap.set("n", "<C-n>", function()
            Snacks.picker.explorer()
          end, { desc = "File Explorer" })
        end

        vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { link = "Fg" })
        vim.api.nvim_set_hl(0, "SnacksPickerPathIgnored", { link = "Fg" })
        vim.api.nvim_set_hl(0, "SnacksPickerDirectory", { link = "Fg" })

        if vim.g.explorer == "mini.files" then
          vim.api.nvim_create_autocmd("User", {
            pattern = "MiniFilesActionRename",
            callback = function(event)
              Snacks.rename.on_rename_file(event.data.from, event.data.to)
            end,
          })
        end
      end,
    })
  end,
}
