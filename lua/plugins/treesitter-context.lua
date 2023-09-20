return {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
        require("plugins.treesitter"),
    },
    config = {
        min_window_height = 20,
        mode = "topline",
        separator = "_",
        multiline_threshold = 4,
    },
}
