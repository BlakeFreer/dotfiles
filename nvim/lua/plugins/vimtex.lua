return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.cmd("filetype plugin indent on")
        vim.opt.syntax = "enable"
        vim.g.vimtex_compiler_method = "latexmk"
    end,
}
