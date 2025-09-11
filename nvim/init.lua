--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
-- See `:help mapleader`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")
require("keymap")
require("ftype")
require("config.lazy")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- I don't really like these keymaps being here but I don't know
-- where else to put them.

-- LuaSnip
local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<Tab>", function()
    if ls.expand_or_jumpable() then
        return "<Plug>luasnip-expand-or-jump"
    elseif ls.jumpable(1) then
        return "<Plug>luasnip-jump-next"
    end
    return "<Tab>"
end, { expr = true, silent = true })

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
    if ls.jumpable(-1) then
        return "<Plug>luasnip-jump-prev"
    else
        return "<S-Tab>"
    end
end, { expr = true, silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        return "<Plug>luasnip-next-choice"
    else
        return "<C-E>"
    end
end, { expr = true, silent = true })
