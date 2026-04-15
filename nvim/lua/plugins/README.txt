April 23, 2025 - Hopefully I won't need this document for long.
April 14, 2026 - Just upgraded to 0.12. LSPs are much cleaner now. I'm using nvim for most of my editing.

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

