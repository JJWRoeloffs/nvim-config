local function set_jdtls_keybinds()
    local jdtls = require("jdtls")
    vim.keymap.set("n", "<leader>joi", function()
        jdtls.organize_imports()
    end, {})
    vim.keymap.set("n", "<leader>jev", function()
        jdtls.extract_variable({ visual = false })
    end, {})
    vim.keymap.set("v", "<leader>jav", function()
        jdtls.extract_variable({ visual = true })
    end, {})
    vim.keymap.set("n", "<leader>jec", function()
        jdtls.extract_constant({ visual = false })
    end, {})
    vim.keymap.set("v", "<leader>jec", function()
        jdtls.extract_constant({ visual = true })
    end, {})
    vim.keymap.set("v", "<leader>jem", function()
        jdtls.extract_method({ visual = true })
    end, {})

    vim.keymap.set("n", "<leader>jdm", function()
        jdtls.test_class()
    end, {})
    vim.keymap.set("n", "<leader>jdc", function()
        jdtls.test_nearest_method()
    end, {})
end

local function setup()
    require("mason-extensions").ensure_installed({
        "jdtls",
        "java-test",
        "java-debug-adapter",
    })
    local jdtls = require("jdtls")
    local lsp_keybinds = require("jjw.lsp-keybinds")

    local config = {
        cmd = { vim.fn.stdpath("data") .. "/mason/packages/jdtls/bin/jdtls" },
        root_dir = vim.fs.dirname(
            vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]
        ),
    }

    local vim_jdtls_group = vim.api.nvim_create_augroup("jdtls", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "java" },
        callback = function()
            jdtls.start_or_attach(config)
            lsp_keybinds.set_keybinds()
            set_jdtls_keybinds()
        end,
        group = vim_jdtls_group,
    })
end

return {
    {
        "mfussenegger/nvim-jdtls",
        dependencies = {
            { "mfussenegger/nvim-dap", config = require("plugins.nvim-dap").setup },
            { "VonHeikemen/lsp-zero.nvim", config = require("plugins.lsp-zero").setup },
            { "williamboman/mason.nvim" },
        },
        ft = { "java" },
        config = setup,
    },
}
