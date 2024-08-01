local function setup()
    require("treesitter-context").setup({
        min_window_height = 20,
        mode = "topline",
        separator = "_",
        multiline_threshold = 4,
        max_lines = 6,
    })
    vim.keymap.set("n", "<leader>tct", "<CMD>TSContextToggle<CR>")
end

return {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter",
            config = require("plugins.treesitter").config,
        },
    },
    config = setup,
}
