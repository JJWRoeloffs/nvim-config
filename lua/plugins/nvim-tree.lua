local function setup()
    require("nvim-tree").setup({
        sync_root_with_cwd = true,
        renderer = {
            full_name = true,
            group_empty = true,
            special_files = {},
            symlink_destination = false,
            indent_markers = {
                enable = true,
            },
            icons = {
                git_placement = "signcolumn",
                show = {
                    file = true,
                    folder = false,
                    folder_arrow = true,
                    git = true,
                },
            },
        },
        update_focused_file = {
            enable = true,
            update_root = true,
            ignore_list = { "help" },
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
        },
        filters = {
            custom = {
                "^.git$",
            },
        },
        actions = {
            change_dir = {
                enable = false,
                restrict_above_cwd = true,
            },
            open_file = {
                resize_window = true,
                window_picker = {
                    chars = "asdfghjkl",
                },
            },
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
