local function setup()
    local lsp = require("lsp-zero")

    local lsp_keybinds = require("jjw.lsp-keybinds")

    lsp.preset("recommended")

    lsp.ensure_installed({
        -- vim
        "lua_ls",

        -- Javascript/Typescript/HTML/CSS
        "tsserver",
        "html",

        -- Python
        "pyright",

        -- Rust
        "rust_analyzer",

        -- CPP
        "clangd",

        -- Latex
        "ltex",

        -- Docker
        "dockerls",
        "docker_compose_language_service",

        -- SQL
        "sqlls",

        -- Scripting
        "powershell_es",
        "bashls",

        -- Data formats
        "yamlls",
        "lemminx",
        "taplo",
        "jsonls",
    })

    -- Fix Undefined global 'vim'
    lsp.configure("lua-language-server", {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
            },
        },
    })

    local cmp = require("cmp")
    local cmp_mappings = lsp.defaults.cmp_mappings({
        ["<C-Space>"] = cmp.mapping.complete(),
    })

    cmp_mappings["<Tab>"] = nil
    cmp_mappings["<S-Tab>"] = nil

    lsp.setup_nvim_cmp({
        mapping = cmp_mappings,
    })

    lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
            error = "E",
            warn = "W",
            hint = "H",
            info = "I",
        },
    })

    lsp.on_attach(lsp_keybinds.set_keybinds())

    lsp.nvim_workspace()

    lsp.setup()
end

return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    dependencies = {
        -- LSP Support
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },

        -- Autocompletion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lua" },

        -- Snippets
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },
    },
    config = setup,
}
