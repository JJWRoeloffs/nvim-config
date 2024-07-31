local function setup()
    -- `python3 -m debugpy --version` must work in the shell this editor is in.
    local dap = require("dap-python")
    dap.setup("python3")

    require("mason-extensions").ensure_installed("debugpy")

    vim.keymap.set("n", "<leader>pdm", dap.test_method)
    vim.keymap.set("n", "<leader>pdc", dap.test_class)
    vim.keymap.set("v", "<leader>pds", dap.debug_selection)
end

return {
    "mfussenegger/nvim-dap-python",
    dependencies = {
        { "williamboman/mason.nvim", config = require("mason").setup },
        {
            "mfussenegger/nvim-dap",
            config = require("plugins.nvim-dap").config,
        },
        {
            "nvim-treesitter/nvim-treesitter",
            config = require("plugins.treesitter").config,
        },
    },
    ft = { "python" },
    config = setup,
}
