return {
  "supermaven-inc/supermaven-nvim",
  -- enabled = vim.g.completion == 'mini',
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<A-y>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
      ignore_filetypes = { cpp = true }, -- or { "cpp", }
      -- color = {
      --   suggestion_color = "#ffffff",
      --   cterm = 244,
      -- },
      log_level = "info",
      disable_inline_completion = vim.g.completion == "blink",
      disable_keymaps = false,
      condition = function()
        return false
      end,
    })

    -- local function accept_suggestion()
    --   local suggestion = require("supermaven-nvim.completion_preview")
    --   suggestion.on_accept_suggestion()
    -- end
    --
    -- vim.keymap.set({ "i", "s" }, "<C-cr>", accept_suggestion)
  end,
}
