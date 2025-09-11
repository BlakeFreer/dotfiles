local function map_n(left, right, desc)
    desc = desc or ""
    vim.keymap.set("n", left, right, { desc = desc })
end
local function map_i(left, right, desc)
    desc = desc or ""
    vim.keymap.set("i", left, right, { desc = desc })
end

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map_n("<Esc>", "<cmd>nohlsearch<CR>")
map_i("jk", "<Esc>")
map_i("kj", "<Esc>")

-- Diagnostic keymaps
map_n("[d", vim.diagnostic.goto_prev, "Go to previous [D]iagnostic message")
map_n("]d", vim.diagnostic.goto_next, "Go to next [D]iagnostic message")
map_n("<leader>e", vim.diagnostic.open_float, "Show diagnostic [E]rror message")
map_n("<leader>q", vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list")

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
map_n("<left>", '<cmd>echo "Use h to move!!"<CR>')
map_n("<right>", '<cmd>echo "Use l to move!!"<CR>')
map_n("<up>", '<cmd>echo "Use k to move!!"<CR>')
map_n("<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map_n("<C-h>", "<C-w><C-h>", "Move focus to the left window")
map_n("<C-l>", "<C-w><C-l>", "Move focus to the right window")
map_n("<C-j>", "<C-w><C-j>", "Move focus to the lower window")
map_n("<C-k>", "<C-w><C-k>", "Move focus to the upper window")

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

map_n("-", "<CMD>Oil<CR>", "Open parent directory")

map_n("<leader>ca", vim.lsp.buf.code_action, "Code Action")

vim.keymap.set(
    { "i", "n" },
    "<leader>L",
    '<Cmd>lua require("luasnip.loaders.from_lua").load({paths="~/.config/nvims/snippets"})<CR>',
    { desc = "Reload snippets" }
)
