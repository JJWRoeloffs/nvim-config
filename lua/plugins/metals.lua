local function setup()
    local metals = require("metals")
    local metals_config = metals.bare_config()

    vim.opt_global.shortmess:remove("F")

    local lsp_keybinds = require("jjw.lsp-keybinds")

    metals_config.settings = {
        showImplicitArguments = true,
        showImplicitConversionsAndClasses = true,
        fallbackScalaVersion = "3.3.0",
    }

    metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

    metals_config.on_attach = function(client, bufnr)
        metals.setup_dap()
        lsp_keybinds.set_keybinds(client, bufnr)
        lsp_keybinds.set_formatting(client, bufnr)
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
        pattern = { "scala", "sbt" },
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
        { "hrsh7th/cmp-nvim-lsp" },

        -- for integration
        { "mfussenegger/nvim-dap", config = require("plugins.nvim-dap").setup },
        { "VonHeikemen/lsp-zero.nvim", config = require("plugins.lsp-zero").setup },
        require("plugins.telescope"),
        require("plugins.lightline"),
    },
    ft = { "scala", "sbt" },
    config = setup,
}
