return {
  "olimorris/codecompanion.nvim",
  lazy = false,
  enabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- "ravitemer/codecompanion-history.nvim",
  },

  config = function()
    require("codecompanion").setup({
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
            width = 0.50,
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
      strategies = {
        chat = {
          adapter = "gemini",
        },
        inline = {
          adapter = "gemini",
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
      prompt_library = {
        ["Document Generator"] = {
          strategy = "chat",
          description = "Write documentation for me",
          opts = {
            index = 11,
            is_slash_cmd = false,
            auto_submit = false,
            short_name = "docs",
          },
          references = {
            {
              type = "file",
              path = {
                "doc/.vitepress/config.mjs",
                "lua/codecompanion/config.lua",
                "README.md",
              },
            },
          },
          prompts = {
            {
              role = "user",
              content = [[I'm rewriting the documentation for my plugin CodeCompanion.nvim, as I'm moving to a vitepress website. Can you help me rewrite it?

I'm sharing my vitepress config file so you have the context of how the documentation website is structured in the `sidebar` section of that file.

I'm also sharing my `config.lua` file which I'm mapping to the `configuration` section of the sidebar.
]],
            },
          },
        },
        ["Refactor"] = {
          strategy = "inline",
          description = "Refactor the selected code",
          opts = {
            index = 1,
            is_slash_cmd = true,
            auto_submit = true,
            short_name = "refactor",
          },
          prompts = {
            {
              role = "user",
              content = "You are a senior software engineer. Refactor the selected code for better readability, performance, or maintainability. Only provide the refactored code, no explanations.",
            },
          },
        },
      },
      extensions = {
        history = {
          enabled = false,
          opts = {
            keymap = "gh",
            save_chat_keymap = "sc",
            auto_save = true,
            expiration_days = 12,
            picker = "default",
            auto_generate_title = true,
            continue_last_chat = false,
            delete_on_clearing_chat = false,
            dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
            enable_logging = false,
          },
        },
      },
    })

    require("plugins.codecompanion.utils.chat-loading"):init()
    require("plugins.codecompanion.utils.extmarks").setup()
  end,
  keys = {
    {
      mode = { "n" },
      "<A-b>",
      "<cmd>CodeCompanionChat Toggle<CR>",
      desc = "Toggle CodeCompanion Chat",
      silent = true,
      noremap = true,
    },
    {
      mode = { "x" },
      "<A-b>",
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
