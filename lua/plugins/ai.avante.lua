return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    enabled = true,
    lazy = false,
    version = false,
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
        "<A-b>",
        "<cmd>AvanteToggle<CR>",
        desc = "Toggle Avante",
        silent = true,
        noremap = true,
      },
    },
    config = function()
      require("avante").setup({
        provider = "gemini",
        selector = {
          provider = "mini_pick",
          provider_opts = {},
        },
        windows = {
          position = "smart",
          ask = {
            floating = false,
          },
        },
      })
    end,
  },
}
