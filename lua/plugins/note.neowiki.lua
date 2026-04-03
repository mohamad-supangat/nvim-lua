return {
  "echaya/neowiki.nvim",
  enabled = false,
  opts = {
    wiki_dirs = {
      {
        name = "Reksa Karya",
        path = vim.env.HOME .. "/Documents/Obsidian/Reksa",
      },
      {
        name = "Aura Komputer",
        path = vim.env.HOME .. "/Documents/Obsidian/AuraKomputer",
      },
    },
  },
  keys = {
    { "<leader>ww", "<cmd>lua require('neowiki').open_wiki()<cr>",          desc = "Open Wiki" },
    { "<leader>wW", "<cmd>lua require('neowiki').open_wiki_floating()<cr>", desc = "Open Wiki in Floating Window" },
    { "<leader>wT", "<cmd>lua require('neowiki').open_wiki_new_tab()<cr>",  desc = "Open Wiki in Tab" },
  },
}
