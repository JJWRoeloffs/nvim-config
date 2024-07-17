local M = {}

function M.set_keybinds(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    local telescope = require("telescope.builtin")

    vim.keymap.set("n", "gd", telescope.lsp_definitions, opts)
    vim.keymap.set("n", "<leader>gt", telescope.lsp_type_definitions, opts)
    vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>v", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "gi", telescope.lsp_implementations, opts)
    vim.keymap.set("n", "gr", telescope.lsp_references, opts)
    vim.keymap.set("n", "gDs", telescope.lsp_document_symbols, opts)
    vim.keymap.set("n", "gws", telescope.lsp_workspace_symbols, opts)
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

function M.setup_cmp_cmdline()
    local cmp = require("cmp")
    cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" },
        },
    })

    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
        }, { { name = "cmdline", option = { ignore_cmds = { "!" } } } }),
    })
end

function M.set_cmp()
    vim.cmd([[
        " Menu
        hi CmpMenu   ctermbg=0
        hi CmpCursorLine ctermbg=8
        " Colour the item kinds correctly
        hi! CmpItemAbbrDeprecated ctermbg=NONE cterm=strikethrough ctermfg=9
        hi! link CmpItemKindVariable Identifier
        hi! link CmpItemKindInterface Type
        hi! link CmpItemKindText String
        hi! link CmpItemKindFunction Function
        hi! link CmpItemKindMethod CmpItemKindFunction
        hi! link CmpItemKindKeyword Keyword
        hi! link CmpItemKindProperty CmpItemKindKeyword
        hi! link CmpItemKindUnit CmpItemKindKeyword
    ]])

    local cmp = require("cmp")
    cmp.setup({
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<C-y>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
        }),
        window = {
            completion = {
                winhighlight = "Normal:CmpMenu,FloatBorder:Pmenu,CursorLine:CmpCursorLine,search:None",
            },
            documentation = {
                border = "rounded",
            },
        },
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
        }, {
            { name = "buffer" },
        }),
    })
    M.setup_cmp_cmdline()
end

return M
