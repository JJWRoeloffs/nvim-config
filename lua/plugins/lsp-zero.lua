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

    local lspconfig = require("lspconfig")
    lspconfig.clangd.setup({
        on_attach = function(client, bufnr)
            client.server_capabilities.signatureHelpProvider = false
        end,
        capabilities = vim.lsp.protocol.make_client_capabilities(),
    })

    require("neodev").setup({
        library = {
            plugins = vim.tbl_keys(require("lazy.core.config").plugins),
            type = true,
        },
    })

    local cmp = require("cmp")
    local cmp_mappings = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    })

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
        { "folke/lsp-colors.nvim" },

        -- Snippets
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },

        -- nvim configuring
        { "folke/neodev.nvim", opts = {} },
        { "folke/trouble.nvim", config = require("plugins.trouble").setup },
    },
    ft = {
        "lua",
        "Javascript",
        "typescript",
        "html",
        "css",
        "python",
        "rust",
        "cpp",
        "latex",
        "docker",
        "sql",
        "powershell",
        "sh",
        "yaml",
        "toml",
        "json",
        "xml",
    },
    config = setup,
}
