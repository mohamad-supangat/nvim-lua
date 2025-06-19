return {
  "nvzone/floaterm",
  enabled = false,
  dependencies = "nvzone/volt",
  opts = {},
  keys = {
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
