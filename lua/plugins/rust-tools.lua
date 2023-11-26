local function setup_crates()
    local crates = require("crates")
    local opts = { silent = true }

    crates.setup()

    vim.keymap.set("n", "<leader>rct", crates.toggle, opts)
    vim.keymap.set("n", "<leader>rcr", crates.reload, opts)

    vim.keymap.set("n", "<leader>rcv", crates.show_versions_popup, opts)
    vim.keymap.set("n", "<leader>rcf", crates.show_features_popup, opts)
    vim.keymap.set("n", "<leader>rcd", crates.show_dependencies_popup, opts)

    vim.keymap.set("n", "<leader>rcu", crates.update_crate, opts)
    vim.keymap.set("v", "<leader>rcu", crates.update_crates, opts)
    vim.keymap.set("n", "<leader>rca", crates.update_all_crates, opts)
    vim.keymap.set("n", "<leader>rcU", crates.upgrade_crate, opts)
    vim.keymap.set("v", "<leader>rcU", crates.upgrade_crates, opts)
    vim.keymap.set("n", "<leader>rcA", crates.upgrade_all_crates, opts)

    -- vim.keymap.set("n", "<leader>rce", crates.expand_plain_crate_to_inline_table, opts)
    -- vim.keymap.set("n", "<leader>rcE", crates.extract_crate_into_table, opts)

    vim.keymap.set("n", "<leader>rcH", crates.open_homepage, opts)
    vim.keymap.set("n", "<leader>rcR", crates.open_repository, opts)
    vim.keymap.set("n", "<leader>rcD", crates.open_documentation, opts)
    vim.keymap.set("n", "<leader>rcC", crates.open_crates_io, opts)
end

local function on_attatch(client, bufnr)
    -- rustup component add rls rust-analysis rust-src
    require("mason-extensions").ensure_installed({ "codelldb", "rust-analyzer" })

    local lsp_keybinds = require("jjw.lsp-keybinds")
    lsp_keybinds.set_keybinds(client, bufnr)
    lsp_keybinds.set_formatting(client, bufnr)

    local rt = require("rust-tools")

    vim.keymap.set("n", "<leader>rhs", rt.inlay_hints.set)
    vim.keymap.set("n", "<leader>rhu", rt.inlay_hints.unset)

    vim.keymap.set("n", "<leader>rem", rt.expand_macro.expand_macro)

    vim.keymap.set("n", "<leader>rmu", rt.move_item.move_item(true))
    vim.keymap.set("n", "<leader>rmd", rt.move_item.move_item(false))

    vim.keymap.set("v", "<leader>rK", rt.hover_range.hover_range)

    vim.keymap.set("n", "<leader>rct", rt.open_cargo_toml.open_cargo_toml)

    vim.keymap.set("n", "<leader>rmu", rt.parent_module.parent_module)

    vim.keymap.set("n", "<leader>rdb", rt.debuggables.debuggables)
end

return {
    {
        "simrat39/rust-tools.nvim",
        dependencies = {
            { "neovim/nvim-lspconfig" },
            { "nvim-lua/plenary.nvim" },
            { "mfussenegger/nvim-dap", config = require("plugins.nvim-dap").setup },
        },
        ft = { "rust", "toml" },
        config = {
            server = {
                on_attach = on_attatch,
            },
        },
    },
    {
        "saecki/crates.nvim",
        tag = "v0.3.0",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = setup_crates,
        ft = { "rust", "toml" },
    },
}
