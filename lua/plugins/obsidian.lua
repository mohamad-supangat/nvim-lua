return {
  enabled = true,
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  cmd = { "Obsidian" },
  keys = {
    { "<leader>ob", ":Obsidian<CR>", noremap = true, silent = true },
    { "<leader>no", ":Obsidian<CR>", noremap = true, silent = true },
  },
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "Personal",
        path = "~/Documents/Obsidian/Personal/",
      },
      {
        name = "Aura Komputer",
        path = "~/Documents/Obsidian/AuraKomputer/",
      },
      {
        name = "Reksa Karya",
        path = "~/Documents/Obsidian/Reksa/",
      },
    },
    notes_subdir = "notes",
    daily_notes = {
      folder = "notes/dailies",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      default_tags = { "daily-notes" },
      template = nil,
    },
    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
    -- open_app_foreground = true,
  },
}
