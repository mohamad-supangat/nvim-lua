return {
  "axkirillov/hbac.nvim",
  enabled = false,
  opts = {
    autoclose = true, -- set autoclose to false if you want to close manually
    threshold = 10, -- hbac will start closing unedited buffers once that number is reached
    close_command = function(bufnr)
      require("mini.bufremove").delete(0, false)
    end,
    close_buffers_with_windows = false, -- hbac will close buffers with associated windows if this option is `true`
    telescope = {
      -- See #telescope-configuration below
    },
  },
}
