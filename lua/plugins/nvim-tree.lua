local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then return end

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

map("n", "<C-n>", ":NvimTreeToggle<CR>", default_opts)

nvim_tree.setup({
  sort_by             = "case_sensitive",
  git                 = {
    ignore = false,
  },
  actions             = {
    open_file = {
      quit_on_open = true
    }
  },
  view                = {
    preserve_window_proportions = true,
    adaptive_size = false,
    mappings = {
      list = {
        { key = "l", action = "edit" },
        { key = "h", action = "close_node" },
        -- { key = "u", action = "dir_up" },
      },
    },
  },
  renderer            = {
    group_empty = true,
  },
  filters             = {
    dotfiles = false,
  },
  update_focused_file = {
    enable = true
  }
})
