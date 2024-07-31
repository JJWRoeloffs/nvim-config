local function setup()
    require("mason-extensions").ensure_installed("tree-sitter-cli")
    require("nvim-treesitter.configs").setup({
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed = {
            -- Basic vim stuff
            "vim",
            "vimdoc",
            "query",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",

            -- Main languages
            "java",
            "scala",
            "python",
            "c",
            "cpp",
            "go",
            "rust",
            "latex",
            "haskell",

            -- Webdev
            "javascript",
            "typescript",
            "http",
            "html",
            "css",

            -- Docker
            "dockerfile",

            -- Scripting
            "bash",

            -- Git
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",

            -- Query
            "graphql",
            "sql",

            -- Data formats
            "json",
            "regex",
            "toml",
            "yaml",
        },
        modules = {},
        sync_install = true,
        ignore_install = {},
        auto_install = false,
    })
end

return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        { "williamboman/mason.nvim", config = require("mason").setup },
    },
    build = ":TSUpdate",
    config = setup,
}
