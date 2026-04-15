return { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    main = "nvim-treesitter",

    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                -- Enable treesitter highlighting and disable regex syntax
                pcall(vim.treesitter.start)
                -- Enable treesitter-based indentation
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })

        local ensure_installed = {
            "bash",
            "c",
            "diff",
            "html",
            "lua",
            "luadoc",
            "latex",
            "markdown",
            "markdown_inline",
            "query",
            "vim",
            "vimdoc",
            "rust",
            "python",
            "toml",
        }

        local already_installed = require("nvim-treesitter.config").get_installed()
        local to_install = vim.iter(ensure_installed)
            :filter(function(parser)
                return not vim.tbl_contains(already_installed, parser)
            end)
            :totable()

        require("nvim-treesitter").install(to_install)
        require("nvim-treesitter.install").update("all")
        require("nvim-treesitter.config").setup({
            auto_install = true,
            highlight = {
                enable = true,
                disable = { "latex" },
            },
        })
    end,
    -- There are additional nvim-treesitter modules that you can use to interact
    --
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
