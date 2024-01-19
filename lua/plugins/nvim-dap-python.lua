local function setup()
    local path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
    local dap = require("dap-python")
    dap.setup(path)

    require("mason-extensions").ensure_installed("debugpy")

    vim.keymap.set("n", "<leader>pdm", dap.test_method)
    vim.keymap.set("n", "<leader>pdc", dap.test_class)
    vim.keymap.set("v", "<leader>pds", dap.debug_selection)
end

return {
    "mfussenegger/nvim-dap-python",
    dependencies = {
        { "mfussenegger/nvim-dap", config = require("plugins.nvim-dap").setup },
        { "williamboman/mason.nvim" },
    },
    ft = { "python" },
    config = setup,
}
