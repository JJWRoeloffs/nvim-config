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

    vim.keymap.set("n", "<leader>rcH", crates.open_homepage, opts)
    vim.keymap.set("n", "<leader>rcR", crates.open_repository, opts)
    vim.keymap.set("n", "<leader>rcD", crates.open_documentation, opts)
    vim.keymap.set("n", "<leader>rcC", crates.open_crates_io, opts)
end

local function setup_rustacean()
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
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
        }, {
            { name = "buffer" },
        }),
    })
end

local function on_attach(client, bufnr)
    require("mason-extensions").ensure_installed({ "codelldb" })
    -- Additionally:
    -- rustup component add rust-analyzer
    -- rustup component add rust-src

    local opts = { silent = true, buffer = bufnr }
    -- rustup component add rls rust-analysis rust-src

    local lsp_keybinds = require("jjw.lsp-keybinds")
    lsp_keybinds.set_keybinds(client, bufnr)
    lsp_keybinds.set_formatting(client, bufnr)

    vim.keymap.set("n", "<leader>rem", function()
        vim.cmd.RustLsp("expandMacro")
    end, opts)

    vim.keymap.set("n", "<leader>rmu", function()
        vim.cmd.RustLsp({ "moveItem", "up" })
    end, opts)
    vim.keymap.set("n", "<leader>rmd", function()
        vim.cmd.RustLsp({ "moveItem", "down" })
    end, opts)

    vim.keymap.set("v", "<leader>rK", function()
        vim.cmd.RustLsp({ "hover", "range" })
    end, opts)

    vim.keymap.set("n", "<leader>rct", function()
        vim.cmd.RustLsp("openCargo")
    end, opts)

    vim.keymap.set("n", "<leader>rmu", function()
        vim.cmd.RustLsp("parentModule")
    end, opts)

    vim.keymap.set("n", "<leader>rdb", function()
        vim.cmd.RustLsp({ "debuggables", "last" })
    end, opts)

    vim.keymap.set("n", "<leader>ree", function()
        vim.cmd.RustLsp("explainError")
    end, opts)

    setup_rustacean()
end

return {
    {
        "mrcjkb/rustaceanvim",
        version = "^3", -- Recommended
        dependencies = {
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lua" },
            { "folke/lsp-colors.nvim" },

            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },

            { "mfussenegger/nvim-dap", config = require("plugins.nvim-dap").setup },

            { "williamboman/mason.nvim", config = require("mason").setup },
            require("plugins.telescope"),
        },
        init = function()
            vim.g.rustaceanvim = {
                server = { on_attach = on_attach },
            }
        end,
        ft = { "rust" },
    },
    {
        "saecki/crates.nvim",
        tag = "v0.3.0",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = setup_crates,
        ft = { "rust", "toml" },
    },
}
