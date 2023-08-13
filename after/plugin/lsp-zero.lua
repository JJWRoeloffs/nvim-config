local lsp = require("lsp-zero")

local lsp_keybinds = require('jjw.lsp-keybinds')

lsp.preset("recommended")

lsp.ensure_installed({
    -- vim
    'lua_ls',

    -- Javascript/Typescript/HTML/CSS
    'tsserver',
    'html',

    -- Python
    'pyright',

    -- Rust
    'rust_analyzer',

    -- CPP
    'clangd',

    -- Latex
    'ltex',

    -- Docker
    'dockerls',
    'docker_compose_language_service',

    -- SQL
    'sqlls',

    -- Scripting
    'powershell_es',
    'bashls',

    -- Data formats
    'yamlls',
    'lemminx',
    'taplo',
    'jsonls',
})

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(lsp_keybinds.set_keybinds())

lsp.nvim_workspace()

lsp.setup()
