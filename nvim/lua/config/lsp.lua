require("mason").setup()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. Available keys are:
--  - cmd (table): Override the default command used to start the server
--  - filetypes (table): Override the default list of associated filetypes for the server
--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
--  - settings (table): Override the default settings passed when initializing the server.
--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
local servers = {
    clangd = {},
    basedpyright = {
        settings = {
            basedpyright = {
                analysis = {
                    typeCheckingMode = "basic",
                },
                disableOrganizeImports = true,
            },
        },
    },
    ruff = {
        -- this isn't working. want to disable "remove unused imports"
        -- init_options = {
        --     settings = {
        --         lint = {
        --             unfixable = { "F401" },
        --         },
        --     },
        -- },
    },
    gopls = {},

    -- rust-analyzer is managed by plugins/rustaceanvim.lua
    -- Don't inlcude it here as it will spawn two servers
    ltex_plus = {
        settings = {
            ltex = {
                language = "en-GB",
            },
        },
    },
    lua_ls = {
        -- cmd = { ... },
        -- filetypes = { ... },
        -- capabilities = {},
        settings = {
            Lua = {
                workspace = {
                    checkThirdParty = false,
                    -- Tells lua_ls where fo find all the Lua files that you have
                    -- loaded for your neovim configuration
                    library = {
                        "${3rd}/luv/library",
                        unpack(vim.api.nvim_get_runtime_file("", true)),
                    },
                },
                completion = {
                    callSnippet = "Replace",
                },
                -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                -- diagnostics = { disable = { 'missing-fields' } },
            },
        },
    },
    stylua = {},
    asm_lsp = {},
    asmfmt = {},
    cmake = {},
    delve = {},
    markdownlint = {},
    prettier = {},
    vale = {}, -- text prose
}

require("mason-tool-installer").setup({ ensure_installed = vim.tbl_keys(servers) })

for server, settings in pairs(servers) do
    vim.lsp.config(server, settings)
end
vim.lsp.config("tex-fmt", {})

require("mason-lspconfig").setup({
    automatic_enable = {
        exclude = {
            "ts_ls",
        },
    },
})
