return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = {
        ensure_installed = {
            -- Basic vim stuff
            "vim",
            "query",
            "lua",

            -- Main languages
            "java",
            "scala",
            "python",
            "c",
            "cpp",
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

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    },
}
