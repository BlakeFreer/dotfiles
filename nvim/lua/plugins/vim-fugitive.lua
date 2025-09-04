return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", ":Git<CR>", { noremap = true, desc = "git status" })
        vim.keymap.set("n", "<leader>ga", ":Git add ", { noremap = true, desc = "git add " })
    end,
}
