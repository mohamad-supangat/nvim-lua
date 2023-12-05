local status_ok, todoc = pcall(require, "todo-comments")

todoc.setup {
    keywords = {
        WIP = { icon = " ", color = "hint", alt = { "WIP" } },
    }
}
