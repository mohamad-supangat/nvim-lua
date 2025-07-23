return {
  "mistweaverco/kulala.nvim",
  enabled = false,
  -- lazy = false,
  keys = {
    { "<leader>rs", desc = "Send request" },
    { "<leader>ra", desc = "Send all requests" },
    { "<leader>rb", desc = "Open scratchpad" },
  },
  ft = { "http", "rest" },
  opts = {
    -- your configuration comes here
    global_keymaps = true,
    global_keymaps_prefix = "<leader>R",
    ui = {
      -- display_mode = "float",
      -- show_icons = nil,
    },
  },
}
