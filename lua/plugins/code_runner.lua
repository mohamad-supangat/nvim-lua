return {
    'CRAG666/code_runner.nvim',
    enabled = false,
    config = function()
        local code_runner = require('code_runner')
        code_runner.setup({
            mode = "float",
            focus = false,
            float = {
                border = "rounded",
            },
            -- put here the commands by filetype
            filetype = {
                fish = "fish",
                java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
                python = "python3 -u",
                typescript = "deno run -A",
                php = "php",
                javascript = "node",
                rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
            },
        })

        vim.keymap.set("n", "<leader>re", "<Plug>RestNvim", { noremap = true, silent = false })
        vim.keymap.set("n", "<leader>rr", ":RunCode<CR>", { noremap = true, silent = false })
        vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
        vim.keymap.set("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
        vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
        vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
        vim.keymap.set("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
        vim.keymap.set("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })
    end
}
