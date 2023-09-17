local function setup()
    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup()
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end

    local opts = { remap = false }

    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, opts)
    vim.keymap.set("n", "<leader>dc", dap.continue, opts)
    vim.keymap.set("n", "<leader>dsi", dap.step_into, opts)
    vim.keymap.set("n", "<leader>dso", dap.step_over, opts)
    vim.keymap.set("n", "<leader>dsu", dap.step_out, opts)
    vim.keymap.set("n", "<leader>dq", dap.terminate, opts)
    vim.keymap.set("n", "<leader>dll", dap.list_breakpoints, opts)
    vim.keymap.set("n", "<leader>dcl", dap.clear_breakpoints, opts)

    vim.keymap.set("n", "<leader>da", dapui.eval, opts)
end

return {
    "mfussenegger/nvim-dap",
    dependencies = {
        { "rcarriga/nvim-dap-ui" },
        require("plugins.treesitter"),
    },
    lazy = true,
    setup = setup,
    build = "npm i @vscode/codicons",
}
