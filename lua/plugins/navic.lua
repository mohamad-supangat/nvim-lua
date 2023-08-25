local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
    return
end
require("barbecue").setup({
    create_autocmd = true, -- prevent barbecue from updating itself automatically
})
navic.setup({
    icons = {
        File = " ",
        Module = " ",
        Namespace = " ",
        Package = " ",
        Class = " ",
        Method = " ",
        Property = " ",
        Field = " ",
        Constructor = " ",
        Enum = " ",
        Interface = " ",
        Function = " ",
        Variable = " ",
        Constant = " ",
        String = " ",
        Number = " ",
        Boolean = " ",
        Array = " ",
        Object = " ",
        Key = " ",
        Null = " ",
        EnumMember = " ",
        Struct = " ",
        Event = " ",
        Operator = " ",
        TypeParameter = " ",
    },
})
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
