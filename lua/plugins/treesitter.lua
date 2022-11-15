local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end

configs.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "php", "lua", "vue", "javascript", "json", "html" },
  sync_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats =
      pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then return true end
    end,
    -- additional_vim_regex_highlighting = true
  },
  autopairs = { enable = true },
  autotag = {
    enable = true
    -- filetypes = {"html", "xml"}
  },
  context_commentstring = { enable = true, enable_autocmd = false },
  indent = { enable = true, disable = { "python", "css", "vue", "pug" } },
  rainbow = { enable = true, extended_mode = true }
}

-- require("nvim-biscuits").setup(
--     {
--         default_config = {
--             max_length = 12,
--             min_distance = 5,
--             prefix_string = " 📎 "
--         },
--         language_config = {
--             html = {
--                 prefix_string = " 🌐 "
--             },
--             javascript = {
--                 prefix_string = " ✨ ",
--                 max_length = 80
--             },
--             -- python = {
--             --     disabled = true
--             -- }
--         }
--     }
-- )

require('nvim_context_vt').setup({
  -- Enable by default. You can disable and use :NvimContextVtToggle to maually enable.
  -- Default: true
  enabled = true,

  -- Override default virtual text prefix
  -- Default: '-->'
  -- prefix = '',

  -- Override the internal highlight group name
  -- Default: 'ContextVt'
  -- highlight = 'CustomContextVt',

  -- Disable virtual text for given filetypes
  -- Default: { 'markdown' }
  disable_ft = { 'markdown' },

  -- Disable display of virtual text below blocks for indentation based languages like Python
  -- Default: false
  disable_virtual_lines = false,

  -- Same as above but only for spesific filetypes
  -- Default: {}
  disable_virtual_lines_ft = { 'yaml' },

  -- How many lines required after starting position to show virtual text
  -- Default: 1 (equals two lines total)
  min_rows = 1
})
