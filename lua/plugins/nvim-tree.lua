local function setup()
    require("nvim-tree").setup({
        sort_by = "case_sensitive",
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = true,
        },
    })

    vim.keymap.set("n", "<leader>a", "<cmd>NvimTreeFindFileToggle<cr>")
end

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = {
        "NvimTreeOpen",
        "NvimTreeToggle",
        "NvimTreeFindFile",
        "NvimTreeFindFileToggle",
    },
    keys = { "<leader>a" },
    config = setup,
}
