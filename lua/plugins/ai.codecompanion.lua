local enableHistory = true

require("plugins.codecompanion.utils.chat-loading"):init()
require("plugins.codecompanion.utils.extmarks").setup()
--
return {
  "olimorris/codecompanion.nvim",
  -- version = "17.33.0",
  lazy = false,
  enabled = vim.g.ai == "codecompanion",
  dependencies = {
    { "nvim-lua/plenary.nvim", version = false },
    -- "franco-ruggeri/codecompanion-spinner.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "ravitemer/codecompanion-history.nvim",
      enabled = enableHistory,
    },
  },

  opts = {
    extensions = {
      history = {
        enabled = true, -- defaults to true
        opts = {
          dir_to_save = vim.fn.stdpath("data") .. "/codecompanion_chats.json",
        }
      }
    },
    interactions = {
      chat = {
        -- adapter = "gemini",
        -- model = "gemini-3-flash-preview",
        opts = {
          completion_provider = (vim.g.completion == "blink") and "blink" or "default",
        },
        keymaps = {
        },
      },
      inline = {
        -- adapter = "gemini",
        -- model = "gemini-3-flash-preview",
        keymaps = {
          accept_change = {
            modes = { n = "ga" },
            description = "Accept the suggested change",
          },
          reject_change = {
            modes = { n = "gr" },
            description = "Reject the suggested change",
          },
        },
      },
    },
    opts = {
      language = "Indonesia",
    },
    display = {
      chat = {
        start_in_insert_mode = false,
        show_references = true,
        separator = "─",
        window = {
          layout = "float",
          height = 0.9,
          width = 0.9,
          opts = {
            breakindent = true,
            cursorcolumn = false,
            cursorline = false,
            foldcolumn = "0",
            linebreak = true,
            list = true,
            number = false,
            -- signcolumn = "yes",
            spell = false,
            wrap = true,
          },
        },
      },
    },
  },
  keys = {
    {
      mode = { "n" },
      "<A-b>",
      "<cmd>CodeCompanionChat Toggle<CR>",
      -- "<cmd>CodeCompanionChat adapter=gemini model=gemini-3-flash-preview Toggle<CR>",

      desc = "Toggle CodeCompanion Chat",
      silent = true,
      noremap = true,
    },
    {
      mode = { "x" },
      "<A-b>",
      "<cmd>CodeCompanionChat<CR>",
      -- "<cmd>CodeCompanionChat adapter=gemini model=gemini-3-flash-preview<CR>",
      desc = "Trigger CodeCompanion Selected to Chat",
      silent = true,
      noremap = true,
    },

    {
      mode = { "x" },
      "<A-i>",
      "<cmd>CodeCompanion<CR>",
      desc = "Trigger CodeCompanion Inline Prom",
      silent = true,
      noremap = true,
    },

    {
      mode = { "x", "n" },
      "<leader>cc",
      "<cmd>CodeCompanionActions<CR>",
      desc = "Toggle CodeCompanion Actions",
      silent = true,
      noremap = true,
    },
  },
}
