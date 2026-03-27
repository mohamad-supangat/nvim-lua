return {
  "nvzone/floaterm",
  enabled = false,
  dependencies = "nvzone/volt",
  opts = {
    mappings = {
      term = function(buf)
        vim.keymap.set({ "n", "t" }, "<C-p>", function()
          require("floaterm.api").cycle_term_bufs("prev")
        end, { buffer = buf })
      end,
    },
    terminals = {
      { name = "Terminal" },
      -- cmd can be function too
      { name = "Lazygit", cmd = "lazygit" },
      -- More terminals
    },
  },
  keys = {
    {
      mode = "n",
      "<leader>gi",
      function()
        local currentFileRootPath = require("utils").currentFileRootPath

        require("floaterm").open()
        require("floaterm.api").new_term({
          cmd = "lazygit",
        })
      end,
    },
    {
      mode = "n",
      "<A-i>",
      "<CMD>FloatermToggle<CR>",
    },
    {
      mode = "t",
      "<A-i>",
      "<C-\\><C-n><CMD>FloatermToggle<CR>",
    },
  },
  cmd = "FloatermToggle",
}
