local M = {}

function M.set_keybinds(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "ta", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>v", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gDs", vim.lsp.buf.document_symbol, opts)
    vim.keymap.set("n", "gws", vim.lsp.buf.workspace_symbol, opts)
end

-- Not all language servers support this, hence the formatter.nvim plugin
-- However, for those that do (e.g. Metals), this function exists
M.formatting_augroup = vim.api.nvim_create_augroup("formatting", {})

function M.set_formatting(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "F", vim.lsp.buf.format, opts)
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = M.formatting_augroup,
        desc = "Format file on save with the LSP",
        pattern = "*",
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end,
    })
end

return M
