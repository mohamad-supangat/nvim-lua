return {
    "3rd/image.nvim",
    enabled = false,
    config = function()
        require("image").setup({
            backend = 'ueberzug'
        })
    end
}
