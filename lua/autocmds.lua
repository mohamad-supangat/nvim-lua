vim.api.nvim_create_autocmd("CmdlineChanged", {
  group = vim.api.nvim_create_augroup("update_search_redraw", {}),
  desc = "Update search redraw",
  callback = function()
    vim.schedule(function()
      vim.cmd("redraw")
    end)
  end,
})
