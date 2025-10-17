local custom_snippets_dir = "~/.config/nvim/snippets"

return {
  {
    "rafamadriz/friendly-snippets",
    lazy = false,
    priority = 1000,
  },

  -- odoo snippets
  -- "droggol/VscOdooSnippets",

  -- laravel snippets
  "onecentlin/laravel5-snippets-vscode",
  "onecentlin/laravel-blade-snippets-vscode",
  -- "anburocky3/bootstrap5-snippets",
  -- -- quasar snippets
  -- "Abdelaziz18003/vscode-quasar-snippets",
  -- { "mohamad-supangat/snippets" },

  {
    "chrisgrieser/nvim-scissors",
    opts = {
      snippetDir = custom_snippets_dir,
      jsonFormatter = "jq",
    },
    keys = {
      {
        "<leader>sne",
        function()
          require("scissors").editSnippet()
        end,
        mode = { "n" },
        noremap = true,
        silent = true,
      },
      {
        "<leader>sna",
        function()
          require("scissors").addNewSnippet()
        end,
        mode = { "n", "x" },
        noremap = true,
        silent = true,
      },
    },
  },
  {
    "hrsh7th/vim-vsnip-integ",
    dependencies = {
      "hrsh7th/vim-vsnip",

      config = function()
        -- Expand
        vim.keymap.set("i", "<C-j>", function()
          return vim.fn["vsnip#expandable"]() == 1 and "<Plug>(vsnip-expand)" or "<C-j>"
        end, { expr = true, silent = true })

        vim.keymap.set("s", "<C-j>", function()
          return vim.fn["vsnip#expandable"]() == 1 and "<Plug>(vsnip-expand)" or "<C-j>"
        end, { expr = true, silent = true })

        -- Expand or jump
        vim.keymap.set("i", "<C-l>", function()
          return vim.fn["vsnip#available"](1) == 1 and "<Plug>(vsnip-expand-or-jump)" or "<C-l>"
        end, { expr = true, silent = true })

        vim.keymap.set("s", "<C-l>", function()
          return vim.fn["vsnip#available"](1) == 1 and "<Plug>(vsnip-expand-or-jump)" or "<C-l>"
        end, { expr = true, silent = true })

        -- Jump forward or backward
        vim.keymap.set("i", "<Tab>", function()
          return vim.fn["vsnip#jumpable"](1) == 1 and "<Plug>(vsnip-jump-next)" or "<Tab>"
        end, { expr = true, silent = true })

        vim.keymap.set("s", "<Tab>", function()
          return vim.fn["vsnip#jumpable"](1) == 1 and "<Plug>(vsnip-jump-next)" or "<Tab>"
        end, { expr = true, silent = true })

        vim.keymap.set("i", "<S-Tab>", function()
          return vim.fn["vsnip#jumpable"](-1) == 1 and "<Plug>(vsnip-jump-prev)" or "<S-Tab>"
        end, { expr = true, silent = true })

        vim.keymap.set("s", "<S-Tab>", function()
          return vim.fn["vsnip#jumpable"](-1) == 1 and "<Plug>(vsnip-jump-prev)" or "<S-Tab>"
        end, { expr = true, silent = true })
      end,
    },
  },
  {
    "L3MON4D3/LuaSnip",
    dev = false,
    version = "v2.*",
    enabled = vim.g.snippets == "luasnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { custom_snippets_dir } })

      local ls = require("luasnip")

      vim.keymap.set({ "i" }, "<C-K>", function()
        ls.expand()
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-L>", function()
        ls.jump(1)
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-H>", function()
        ls.jump(-1)
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
    end,
  },
}
