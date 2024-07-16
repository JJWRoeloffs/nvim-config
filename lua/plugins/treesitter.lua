return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            -- Basic vim stuff
            "vim",
            "vimdoc",
            "query",
            "lua",
            "luadoc",
            "markdown",
            "markdown-inline",

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
        highlight = { enable = true },
        indent = { enable = true },
    },
}
