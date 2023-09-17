local function setup()
    local trouble = require("trouble")
    trouble.setup({
        icons = false,
        fold_open = "v", -- icon used for open folds
        fold_closed = ">", -- icon used for closed folds
        indent_lines = false, -- add an indent guide below the fold icons
        signs = {
            -- icons / text used for a diagnostic
            error = "error",
            warning = "warn",
            hint = "hint",
            information = "info",
        },
        use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
    })

    vim.keymap.set("n", "<leader>t", function()
        trouble.toggle("document_diagnostics")
    end, { silent = true, noremap = true })
end

return {
    "folke/trouble.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    cmd = { "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh" },
    keys = { "<leader>t" },
    config = setup,
}
