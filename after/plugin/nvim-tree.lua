require("nvim-tree").setup({
    sort_by = "case_sensitive",
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

api = require("nvim-tree.api")

vim.keymap.set("n", "<leader>a", function()
    api.tree.toggle({ path = "<arg>" })
end, {})
