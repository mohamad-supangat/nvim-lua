return {
  "itsfernn/auto-gnome-theme.nvim",
  enabled = false,
  -- Ensure your chosen themes are installed!
  dependencies = {
    -- "folke/tokyonight.nvim",
    -- "rose-pine/neovim",
  },

  -- Configuration runs after the plugin is loaded
  config = function()
    require("auto-gnome-theme").setup({
      -- See Configuration section below
      theme = "randomhue"
      -- dark_theme = "tokyonight",
      -- light_theme = "rose-pine",
    })
  end,
}
