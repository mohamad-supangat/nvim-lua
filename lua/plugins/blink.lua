return {
  {
    "saghen/blink.cmp",
    enabled = true,
    -- version = '*',
    version = false,
    event = { "LspAttach", "InsertCharPre" },
    dependencies = {
      -- {
      --     "saghen/blink.compat",
      --     opts = {
      --         impersonate_nvim_cmp = true,
      --         enable_events = true
      --     }
      -- },
    },
    opts = {
      enabled = function()
        return vim.b.completion ~= false
        -- return not vim.tbl_contains(require('variables').exclude, vim.bo.filetype)
        --     and vim.bo.buftype ~= "prompt"
        --     and vim.b.completion ~= false
      end,
      fuzzy = {
        sorts = { "score", "label" },
        implementation = "lua",
        -- prebuilt_binaries = {
        --     force_version = "v0.7.3",
        -- },
      },

      sources = {
        default = {
          "snippets",
          "lsp",
          "path",
          "buffer",
          "minuet",
        },
        per_filetype = {
          codecompanion = { "codecompanion" },
        },
        providers = {
          minuet = {
            name = "minuet",
            module = "minuet.blink",
            async = true,
            score_offset = 10000,
          },
        },
      },

      keymap = {
        preset = "none",
        ["<A-y>"] = {
          function(cmp)
            cmp.show({ providers = { "minuet" } })
          end,
        },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-space>"] = { "show", "hide" },
        ["<C-S-k>"] = { "show_documentation", "hide_documentation", "fallback" },
        ["<C-e>"] = { "hide", "fallback" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },

        -- ["<C-l>"] = { "accept", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      },
      completion = {
        keyword = { range = "full" },
        accept = { auto_brackets = { enabled = false } },
        list = { selection = { preselect = true, auto_insert = false } },
        menu = {
          auto_show = true,
          -- auto_show = function(ctx)
          --     return ctx.mode ~= 'cmdline' and
          --         not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype()) and
          --         not vim.tbl_contains(require('variables').exclude, vim.bo.filetype)
          -- end,
          draw = {
            gap = 2,
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
            -- treesitter = { 'lsp' }
          },
        },
        documentation = {
          auto_show = true,
          -- auto_show_delay_ms = 200,
          window = {
            -- border = "rounded",
            -- winhighlight =
            -- 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
          },
        },
        trigger = {
          prefetch_on_insert = false,
          show_on_trigger_character = false,
          show_on_insert_on_trigger_character = false,
          show_on_accept_on_trigger_character = false,
        },
        ghost_text = { enabled = false },
      },
      -- signature = { window = { border = 'single' } },
      appearance = {
        use_nvim_cmp_as_default = true,
        -- nerd_font_variant = 'mono'
      },
    },
    -- opts_extend = {
    -- "sources.default",
    -- "sources.completion.enabled_providers"
    -- },
  },
}
