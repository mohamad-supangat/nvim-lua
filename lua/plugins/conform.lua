return {
  {
    "stevearc/conform.nvim",
    enabled = true,
    -- lazy = "VeryLazy",
    event = { "BufWritePre" },
    dependencies = {
      {
        "mason-org/mason.nvim",
        lazy = false,
      },
      {
        "zapling/mason-conform.nvim",
        enabled = true,
        opts = {},
        dependencies = {
          {
            "mason-org/mason.nvim",
            lazy = false,
          },
        },
      },
    },
    keys = {
      {
        "<leader>fm",
        "<cmd>AllFormat<cr>",
        noremap = true,
        silent = true,
        desc = "Format Buffer",
      },
    },

    config = function()
      -- start of formatter {{{
      local util = require("conform.util")

      require("conform").setup({
        formatters_by_ft = {
          ["*"] = { "trim_whitespace", "trim_newlines" },
          lua = { "stylua" },
          python = { "blue", "ruff_fix", "ruff_format" },
          php = { "php_cs_fixer", "lsp" },
          blade = { "blade-formatter" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          json = { "prettier" },
          jsonc = { "prettier" },
          vue = { "prettier" },
          pug = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          scss = { "prettier" },
          sass = { "prettier" },
          bash = { "shfmt" },
          sh = { "shfmt" },
          nginx = { "nginxfmt" },
        },

        formatters = {
          php_cs_fixer = {
            command = "php-cs-fixer",
            env = {
              PHP_CS_FIXER_IGNORE_ENV = "1",
            },
            args = { "fix", "$FILENAME", "--config", "/home/deve/.config/nvim/configs/php-cs-fixer.php" },
            stdin = false,
            cwd = util.root_file({ "composer.json" }),
          },
        },
      })

      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --     pattern = "*",
      --     callback = function()
      --         if vim.g.disable_autoformat then
      --             return
      --         end
      --         vim.cmd.AllFormat()
      --     end,
      -- })

      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })
      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = "Re-enable autoformat-on-save",
      })

      vim.api.nvim_create_user_command("AllFormat", function()
        vim.lsp.buf.format({ async = false })
        require("conform").format({ lsp_fallback = false })
      end, {
        desc = "Format using lsp zero then conform",
      })

      -- }}} end for formmater config
    end,
  },
}
