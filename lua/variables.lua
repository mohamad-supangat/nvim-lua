local filetypes = {
    "regex",
    "markdown_inline",
    "vimdoc",
    "lua",
    "typescript",
    "vue",
    "pug",
    "python",
    "php",
    "phpdoc",
    "prisma",
    "markdown",
    "html",
    "vim",
    "json",
    "css",
    "dockerfile",
    "bash",
    "fish",
    "javascript",
    "scss",
    "http",
    "blade",
    "xml",
}


local exclude = {
    "terminal",
    "startify",
    "nvim-tree",
    "CHADTree",
    "chad-tree",
    "no-profile",
    "alpha",
    "coc-explorer",
    "Starter",
    "starter",
    "FTermm",
}

return {
    filetypes = filetypes,
    exclude = exclude,
}
