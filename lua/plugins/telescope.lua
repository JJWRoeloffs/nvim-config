local function setup()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>f", builtin.find_files, {})
    vim.keymap.set("n", "<leader>k", builtin.git_files, {})
    vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>b", builtin.buffers, {})
    vim.keymap.set("n", "<leader>e", builtin.registers, {})

    require("telescope").setup({
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    })
    require("telescope").load_extension("fzf")
end

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = {
        -- Also, the native ripgrep package for faster searching
        { "nvim-lua/plenary.nvim" },
        { "nvim-tree/nvim-web-devicons" },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        },
    },
    cmd = { "Telescope" },
    keys = { "<leader>f", "<leader>k", "<leader>g", "<leader>b", "<leader>e" },
    config = setup,
}
