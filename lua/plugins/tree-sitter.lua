local variables = require("variables")

return {
  {
    "folke/ts-comments.nvim",
    opts = {
      lang = {
        blade = "{{-- %s --}}",
      },
    },
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 20, -- Maximum number of lines to show for a single context
      trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = "_",
      zindex = 20, -- The Z-index of the context window
      on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    },
  },
  {
    "andersevenrud/nvim_context_vt",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    enabled = false,
    opts = {
      prefix = "",
      disable_ft = { "markdown", "codecompanion" },
      disable_virtual_lines = false,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
    lazy = false,
    dependencies = {},
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        ensure_installed = variables.filetypes,
        sync_install = false,
        ignore_install = {},
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },
        indent = { enable = true, disable = { "pug", "vue" } },
      })

      vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        pattern = "*.blade.php",
        callback = function()
          vim.opt.filetype = "blade"
        end,
      })

      vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        pattern = "*.http",
        callback = function()
          vim.opt.filetype = "http"
        end,
      })
    end,
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
    cmd = "Neogen",
    keys = {
      { "<Leader>nf", ":lua require('neogen').generate()<CR>", noremap = true, silent = true },
    },
    opts = {},
  },
  {
    "windwp/nvim-ts-autotag",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
        aliases = {
          ["blade"] = "html",
          ["html.handlebars"] = "html",
        },
      })
    end,
  },
}
