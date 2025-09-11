return {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    build = "make install_jsregexp",
    config = function()
        require("luasnip").setup({
            enable_autosnippets = true,
            update_events = { "TextChanged", "TextChangedI" },
        })

        require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets" } })
    end,
}
