-----------------------------------------------------------
-- Treesitter configuration file
-----------------------------------------------------------

-- Plugin: nvim-treesitter
--- https://github.com/nvim-treesitter/nvim-treesitter
require("nvim-treesitter.configs").setup {
    ensure_installed = "maintained",
    indent = {
        enable = true
    },
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {"c", "rust"} -- list of language that will be disabled
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = 1000000, -- Do not enable for files with more than 1000 lines, int
    },
    autotag = {
        enable = true,
        filetypes = { 'html' , 'xml', 'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue' },
    }
}


--[[ require('nvim-biscuits').setup({
  default_config = {
    max_length = 12,
    min_distance = 5,
    prefix_string = " 📎 "
  },
  language_config = {
    html = {
      prefix_string = " 🌐 "
    },
    javascript = {
      prefix_string = " ✨ ",
      max_length = 80
    },
    python = {
      disabled = true
    }
  }
}) ]]
