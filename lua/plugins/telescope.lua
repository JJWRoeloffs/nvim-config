local function setup()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>f", builtin.find_files, {})
    vim.keymap.set("n", "<leader>k", builtin.git_files, {})
    vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>b", builtin.buffers, {})
    vim.keymap.set("n", "<leader>e", builtin.registers, {})
end

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-tree/nvim-web-devicons" },
    },
    config = setup,
}
