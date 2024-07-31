local function setup_codelldb()
    local dap = require("dap")
    require("mason-extensions").ensure_installed("codelldb")

    dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
            command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/codelldb",
            args = { "--port", "${port}" },
        },
    }

    dap.configurations.c = {
        {
            name = "codelldb",
            type = "codelldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: " .. vim.fn.getcwd() .. "/")
            end,
            cwd = "${workspaceFolder}",
            terminal = "integrated",
        },
    }

    dap.configurations.cpp = dap.configurations.c
end

local function setup()
    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.before.attach.dapui_config = function()
        dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
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

    setup_codelldb()
end

return {
    "mfussenegger/nvim-dap",
    dependencies = {
        { "rcarriga/nvim-dap-ui" },
        { "nvim-neotest/nvim-nio" },
        require("plugins.treesitter"),
    },
    ft = { "cpp", "c" },
    setup = setup,
    build = "npm i @vscode/codicons",
}
