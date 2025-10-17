local function setup()
    local lsp_keybinds = require("jjw.lsp-keybinds")

    vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
            lsp_keybinds.set_keybinds(nil, event.buf)
        end,
    })

    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

    local default_setup = function(server)
        require("lspconfig")[server].setup({
            capabilities = lsp_capabilities,
        })
    end

    require("mason").setup({})
    require("mason-lspconfig").setup({
        ensure_installed = {
            -- vim
            "lua_ls",

            -- Javascript/Typescript/HTML/CSS
            "ts_ls",
            "html",

            -- Python
            "pyright",

            -- CPP
            "clangd",

            -- go
            "gopls",

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
            "r_language_server",

            -- Data formats
            "yamlls",
            "lemminx",
            "taplo",
            "jsonls",
        },
        handlers = {
            default_setup,
        },
    })

    lsp_keybinds.set_cmp()
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- LSP Support
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },

        -- Autocompletion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lua" },
        { "folke/lsp-colors.nvim" },

        -- Snippets
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },
    },
    ft = {
        "lua",
        "Javascript",
        "typescript",
        "html",
        "css",
        "python",
        "c",
        "cpp",
        "go",
        "latex",
        "r",
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
