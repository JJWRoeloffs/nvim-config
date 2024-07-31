local function setup()
    local metals = require("metals")
    local metals_config = metals.bare_config()

    vim.opt_global.shortmess:remove("F")

    local lsp_keybinds = require("jjw.lsp-keybinds")
    lsp_keybinds.set_cmp()

    metals_config.settings = {
        showImplicitArguments = true,
        showImplicitConversionsAndClasses = true,
        fallbackScalaVersion = "3.3.3",
    }

    metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

    metals_config.on_attach = function(client, bufnr)
        metals.setup_dap()
        lsp_keybinds.set_keybinds(client, bufnr)
    end

    metals_config.init_options.statusBarProvider = "on"

    vim.keymap.set("n", "<leader>mws", metals.hover_worksheet)

    vim.keymap.set("n", "<leader>mc", require("telescope").extensions.metals.commands)

    local tvp = require("metals.tvp")
    vim.keymap.set("n", "<leader>mtt", tvp.toggle_tree_view)
    vim.keymap.set("n", "<leader>mtr", tvp.reveal_in_tree)

    local dap = require("dap")
    dap.configurations.scala = {
        {
            type = "scala",
            request = "launch",
            name = "RunOrTest",
            metals = {
                runType = "runOrTestFile",
                --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
            },
        },
        {
            type = "scala",
            request = "launch",
            name = "Test Target",
            metals = {
                runType = "testTarget",
            },
        },
    }

    local nvim_metals_group =
        vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt", "java", "sc" },
        callback = function()
            metals.initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
    })
end

return {
    "scalameta/nvim-metals",
    dependencies = {
        -- Hard
        { "nvim-lua/plenary.nvim" },

        -- LSP Support
        { "neovim/nvim-lspconfig" },
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

        -- for integration
        {
            "mfussenegger/nvim-dap",
            config = require("plugins.nvim-dap").config,
        },
        {
            "nvim-telescope/telescope.nvim",
            config = require("plugins.telescope").config,
        },
        { "itchyny/lightline.vim", config = require("plugins.lightline").config },
    },
    ft = { "scala", "sbt", "java", "sc" },
    config = setup,
}
