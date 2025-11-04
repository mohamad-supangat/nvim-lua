-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------

-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.g.mapleader = " " -- change leader to a comma
vim.opt.mouse = "a" -- enable mouse support
vim.opt.clipboard = "unnamedplus" -- copy/paste to system clipboard
vim.opt.swapfile = false -- don't use swapfile

vim.o.backup = false -- This is recommended by coc
vim.o.swapfile = false
vim.o.writebackup = false -- This is recommended by coc

vim.g.backspace = "indent,eol,start" -- backspace indent

vim.o.list = true
vim.o.confirm = true -- show dialog for unsaved file(s) before quit
vim.opt.listchars = {
  tab = "▏ ",
  trail = "·",
  extends = "»",
  precedes = "«",
}

vim.o.undofile = true -- enable persistent undo
vim.o.undolevels = 10000 -- 10x more undo levels
-- Automatically re-read file if a change was detected outside of vim
vim.opt.autoread = true
vim.opt.lazyredraw = true -- improve scrolling performance when navigating through large results
vim.go.lazyredraw = true

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
vim.opt.number = true -- show line number
vim.opt.showmatch = true -- highlight matching parenthesis
-- vim.opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
vim.opt.colorcolumn = "120" -- line lenght marker at 80 columns
-- cmd([[autocmd FileType text,markdown,tex setlocal textwidth=80]])
vim.opt.splitright = true -- vertical split to the right
vim.opt.splitbelow = true -- orizontal split to the bottom
vim.opt.ignorecase = true -- ignore case letters when search
vim.opt.smartcase = true -- ignore lowercase for the whole pattern
vim.opt.signcolumn = "yes"
vim.opt.wrap = true
vim.opt.cursorline = true
-- vim.opt.guicursor = "n-v-i-c:block-Cursor"
-- vim.o.winborder = "rounded"
-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
vim.opt.hidden = true -- enable background buffers
vim.opt.history = 100 -- remember n lines in history
vim.opt.lazyredraw = false -- faster scrolling
vim.opt.synmaxcol = 240 -- max column for syntax highlight

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
vim.opt.termguicolors = true -- enable 24-bit RGB
vim.gt_Co = 256
vim.g.syntax_on = true

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
vim.opt.expandtab = true -- use spaces instead of tabs
vim.o.shiftround = true -- round indent to multiple of 'shiftwidth'
vim.o.shiftwidth = 0 -- 0 to follow the 'tabstop' value
vim.opt.tabstop = 4 -- 1 tab == 4 spaces
vim.opt.smartindent = true -- autoindent new lines

vim.opt.autoindent = true
-- cmd[[set autoindent]]
-- don't auto commenting new lines
-- cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

-- remove line lenght marker for selected filetypes
-- cmd([[autocmd FileType text,markdown,xml,html,xhtml,javascript setlocal cc=0]])
-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
-- vim.opt.completeopt = "menuone,noselect,menu" -- completion options
--vim.opt.shortmess = 'c' 	-- don't show completion messages

-- Don't automatically collapse markdown and Latex
vim.opt.conceallevel = 2
-- vim.g.tex_conceal = ""

-- vim.opt.laststatus = 3
-- vim.opt.cmdheight = 0
