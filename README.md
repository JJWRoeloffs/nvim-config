# My Neovim Config

This repository contains my own Neovim configuration files, seperate from my other [dotfiles](https://github.com/JJWRoeloffs/dotfiles) because I found I only really update and tweak nvim, and can now more peacefully let the tiler config go out of date as I wait for Hyperland to get good enough to replace awesomeWM.

If you're here, that might mean you're interested in understanding how it's all set up, so I'll give you a small tour.

The main idea of this config is that I wanted all my plugins to live completely seperate lives, which is to say that adding, removing or updating a plugin should only require editing a single file in `lua/plugins/`. The rest is either global settings and configs (`lua/jjw/`, `ftplugin/`), or code I needed to write to get this to work (`lua/mason-extensions/`)

In `lua/jjw` you will find my personal preferences for vim, settings like mapping `i` to `zzi`, setting relativenumber to true, and that sort of thing. The notable file here is `lsp-keybinds.lua`, which contains a function to call when an LSP gets loaded to vim's `vim.lsp` protocol, and `gd` should be remapped from vim's own go-to-definition to `vim.lsp.buf.lsp_definitions()` among many others. This was needed because I have several different LSPs installed (rust-tools, jdtls, metals, and some geric ones trough lsp-zero), and want to call the same generic keybinds for all of them, without either duplicating code, or having them depend on eachother / be in the same file.

In `lua/plugins` you'll find all the seperate files for all the seperate plugins I use, and some I don't use anymore but haven't cleaned away while they are not of any bother. Files are named after the plugin, so, if you're interested in seeing how I configured a certain plugin, you'll find that there.

Lastly `lua/mason-extensions` contains a small bit of code I needed to write to get this one-plugin-one-file architecture going. You see, multiple plugins required mason to install dependencies, like formatter.nvim needing to install black and prettier and clang-format, and nvim-dap-python needing to install debugpy. Mason extensions exports the function `require(mason-extensions).ensure_installed()`, which I can call in any file for a plugin that needs something, to have that then call mason in a global way in the backend, as mason's normal `ensure_installed` can only be called once.
