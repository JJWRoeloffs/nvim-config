-- Note, this requires Haskell-language-server to be installed seperately
-- ghcup install hls

local function set_hls_keybinds(client, bufnr)
    require("jjw.lsp-keybinds").set_keybinds(client, bufnr)
    -- This currently doesn't work for some reason.
    -- require("mason-extensions").ensure_installed("haskell-language-server")

    local haskell_tools = require("haskell-tools")

    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "<leader>hca", vim.lsp.codelens.run, opts)
    vim.keymap.set("n", "<leader>hs", haskell_tools.hoogle.hoogle_signature, opts)
    vim.keymap.set("n", "<leader>hea", haskell_tools.lsp.buf_eval_all, opts)
    vim.keymap.set("n", "<leader>htr", haskell_tools.repl.toggle, opts)
    vim.keymap.set("n", "<leader>hrf", function()
        haskell_tools.repl.toggle(vim.api.nvim_buf_get_name(0))
    end, opts)
    vim.keymap.set("n", "<leader>hrq", haskell_tools.repl.quit, opts)
end

local function make_setup()
    vim.g.haskell_tools = {
        hls = { on_attach = set_hls_keybinds },
    }
    return require("jjw.lsp-keybinds").set_cmp
end

return {
    "mrcjkb/haskell-tools.nvim",
    version = "^3", -- Recommended
    dependencies = {
        -- Autocompletion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lua" },
        { "folke/lsp-colors.nvim" },

        -- Snippets
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },
    },
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    config = make_setup(),
}
