return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name, _bufnr)
                if name == ".git" then
                    return true
                end
                return false
            end,
        },
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
}
