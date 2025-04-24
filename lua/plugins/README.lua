return {}
--[[
April 23, 2025 - Hopefully I won't need this document for long.

Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.

This is often very useful to both group configuration, as well as handle
lazy loading plugins that don't need to be loaded immediately at startup.

For example, in the following configuration, we use:
event = 'VimEnter'

which loads which-key before all the UI elements are loaded. Events can be
normal autocommands events (`:help autocmd-events`).

Then, because we use the `opts` key (recommended), the configuration runs
after the plugin has been loaded as `require(MODULE).setup(opts)`.

The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
init.lua. If you want these files, they are in the repository, so you can just download them and
place them in the correct locations.

 NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart

Here are some example plugins that I've included in the Kickstart repository.
Uncomment any of the lines below to enable them (you will need to restart nvim).

require 'kickstart.plugins.debug',
require 'kickstart.plugins.indent_line',
require 'kickstart.plugins.lint',
require 'kickstart.plugins.autopairs',
require 'kickstart.plugins.neo-tree',
require 'kickstart.plugins.gitsigns',  adds gitsigns recommend keymaps

 NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
    This is the easiest way to modularize your config.

Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
{ import = 'custom.plugins' },

For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
Or use telescope!
In normal mode type `<space>sh` then write `lazy.nvim-plugin`
you can continue same window with `<space>sr` which resumes last telescope search
--]]
