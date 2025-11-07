local utils = require("utils")
local workspaces
if utils.is_huawei_host() then
  workspaces = {
    {
      name = "Reksa Karya",
      path = "~/Documents/Obsidian/Reksa/",
    },
    {
      name = "Aura Komputer",
      path = "~/Documents/Obsidian/AuraKomputer/",
    },
  }
else
  workspaces = {
    {
      name = "Aura Komputer",
      path = "~/Documents/Obsidian/AuraKomputer/",
    },
    {
      name = "Reksa Karya",
      path = "~/Documents/Obsidian/Reksa/",
    },
  }
end
return {
  enabled = true,
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  cmd = { "Obsidian" },
  keys = {
    { "<leader>ob", ":Obsidian<CR>",              noremap = true, silent = true },
    { "<leader>no", ":Obsidian<CR>",              noremap = true, silent = true },
    { "<leader>nw", ":Obsidian workspace<CR>",    noremap = true, silent = true },
    { "<leader>nk", ":Obsidian quick_switch<CR>", noremap = true, silent = true },
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
    workspaces = workspaces,
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
    completion = {
      blink = vim.g.completion == "blink",
    },
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,

    -- open_app_foreground = true,
  },
}
