-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local fn = vim.fn -- call Vim functions
local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = " " -- change leader to a comma
opt.mouse = "a" -- enable mouse support
opt.clipboard = "unnamedplus" -- copy/paste to system clipboard
opt.swapfile = false -- don't use swapfile

vim.o.backup = false -- This is recommended by coc
vim.o.swapfile = false
vim.o.writebackup = false -- This is recommended by coc

g.backspace = "indent,eol,start" -- backspace indent

-- Automatically re-read file if a change was detected outside of vim
opt.autoread = true
opt.lazyredraw = true -- improve scrolling performance when navigating through large results

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true -- show line number
opt.showmatch = true -- highlight matching parenthesis
-- opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
-- opt.colorcolumn = '80'        -- line lenght marker at 80 columns
cmd [[autocmd FileType text,markdown,tex setlocal textwidth=80]]
opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- orizontal split to the bottom
opt.ignorecase = true -- ignore case letters when search
opt.smartcase = true -- ignore lowercase for the whole pattern
opt.signcolumn = "yes"
opt.wrap = true
opt.cursorline = true

-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- highlight on yank
exec(
    [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]],
    false
)

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- enable background buffers
opt.history = 100 -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240 -- max column for syntax highlight

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
opt.termguicolors = true -- enable 24-bit RGB
g.t_Co = 256
g.syntax_on = true


cmd [[colorscheme gruvbox-material]]

cmd [[let g:gruvbox_material_transparent_background = 1]]
cmd [[set background=dark]]

g.gruvbox_material_background = 'hard'
g.gruvbox_material_better_performance = true

--[[
require("github-theme").setup(
    {
        theme_style = "dark_default",
        comment_style = "italic",
        keyword_style = "italic",
        function_style = "italic",
        variable_style = "italic",
        function_style = "italic",
        sidebars = {"qf", "vista_kind", "terminal", "packer", "nvim-tree"}
    }
) ]]

-----------------------------------------------------------
-- Statusline
-----------------------------------------------------------

--[[ vim.opt.statusline =
    "  %   %f %m %r %w %= Ln %l, Col %c  %{&fileencoding?&fileencoding:&encoding}  "
 ]]
-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 4 -- shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- autoindent new lines

opt.autoindent = true
-- cmd[[set autoindent]]
-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,xml,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
opt.completeopt = "menuone,noselect,menu" -- completion options
--opt.shortmess = 'c' 	-- don't show completion messages

-- Don't automatically collapse markdown and Latex
opt.conceallevel = 0
g.tex_conceal = ""
