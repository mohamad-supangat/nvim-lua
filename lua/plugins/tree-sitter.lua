return {
  {
    "folke/ts-comments.nvim",
    opts = {
      lang = {
        blade = "{{-- %s --}}",
      },
    },
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1 and vim.g.enable_treesitter == 1,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = vim.fn.has("nvim-0.10.0") == 1 and vim.g.enable_treesitter == 1,

    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 20, -- Maximum number of lines to show for a single context
      trim_scope = "outer",     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = "cursor",          -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = "_",
      zindex = 20,     -- The Z-index of the context window
      on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    },
    keys = {
      { "[c", function() require("treesitter-context").go_to_context(vim.v.count1) end }
    }
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
    branch = "main",
    enabled = vim.fn.has("nvim-0.10.0") == 1 and vim.g.enable_treesitter == 1,
    lazy = false,
    dependencies = {},
    opts = {
      ensure_installed = {
        "css",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "toml",
        "tsx",
        "typescript",
        "vue",
        "php",
        "blade",
      },
    },
    config = function(_, opts)
      function start_treesitter(buffer, parser)
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start(buffer, parser)
        -- folds, provided by Neovim
        -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo.foldmethod = 'expr'
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end

      -- based on https://github.com/xaaha/dev-env/blob/main/nvim/.config/nvim/lua/xaaha/plugins/lsp-nvim-treesitter.lua
      --
      -- install parsers from custom opts.ensure_installed
      if opts.ensure_installed and #opts.ensure_installed > 0 then
        require("nvim-treesitter").install(opts.ensure_installed)
        -- register and start parsers for filetypes
        for _, parser in ipairs(opts.ensure_installed) do
          local filetypes = parser -- In this case, parser is the filetype/language name
          vim.treesitter.language.register(parser, filetypes)

          vim.api.nvim_create_autocmd({ "FileType" }, {
            pattern = filetypes,
            callback = function(event)
              start_treesitter(event.buf, parser)
            end,
          })
        end
      end

      -- Auto-install and start parsers for any buffer
      vim.api.nvim_create_autocmd({ "BufRead" }, {
        callback = function(event)
          local bufnr = event.buf
          local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

          -- Skip if no filetype
          if filetype == "" then
            return
          end

          -- Check if this filetype is already handled by explicit opts.ensure_installed config
          for _, filetypes in pairs(opts.ensure_installed) do
            local ft_table = type(filetypes) == "table" and filetypes or { filetypes }
            if vim.tbl_contains(ft_table, filetype) then
              return -- Already handled above
            end
          end

          -- Get parser name based on filetype
          local parser_name = vim.treesitter.language.get_lang(filetype) -- might return filetype (not helpful)
          if not parser_name then
            return
          end
          -- Try to get existing parser (helpful check if filetype was returned above)
          local parser_configs = require("nvim-treesitter.parsers")
          if not parser_configs[parser_name] then
            return -- Parser not available, skip silently
          end

          local parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

          if not parser_installed then
            -- If not installed, install parser synchronously
            require("nvim-treesitter").install({ parser_name }):wait(30000)
          end

          -- let's check again
          parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

          if parser_installed then
            -- Start treesitter for this buffer
            start_treesitter(bufnr, parser_name)
          end
        end,
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
    enabled = vim.fn.has("nvim-0.10.0") == 1 and vim.g.enable_treesitter == 1,
    cmd = "Neogen",
    keys = {
      { "<Leader>nf", ":lua require('neogen').generate()<CR>", noremap = true, silent = true },
    },
    opts = {},
  },
  {
    "windwp/nvim-ts-autotag",
    enabled = vim.fn.has("nvim-0.10.0") == 1 and vim.g.enable_treesitter == 1,
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
