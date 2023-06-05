local lsp_keybinds = require("jjw.lsp-keybinds")

require("formatter").setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        lua = {
            require("formatter.filetypes.lua").stylua,
        },

        javascript = {
            require("formatter.filetypes.javascript").prettier,
        },
        typescript = {
            require("formatter.filetypes.typescript").prettier,
        },
        css = {
            require("formatter.filetypes.css").prettier,
        },
        html = {
            require("formatter.filetypes.html").prettier,
        },
        markdown = {
            require("formatter.filetypes.markdown").prettier,
        },
        json = {
            require("formatter.filetypes.json").prettier,
        },

        c = {
            require("formatter.filetypes.c").clangformat,
        },
        cpp = {
            require("formatter.filetypes.cpp").clangformat,
        },

        java = {
            require("formatter.filetypes.java").clangformat,
        },

        rust = {
            require("formatter.filetypes.rust").rustfmt,
        },

        haskell = {
            require("formatter.filetypes.haskell").stylish_haskell,
        },

        latex = {
            require("formatter.filetypes.latex").latexindent,
        },

        python = {
            require("formatter.filetypes.python").black,
        },

        sh = {
            require("formatter.filetypes.sh").shfmt,
        },

        yaml = {
            require("formatter.filetypes.yaml").pyaml,
        },

        toml = {
            require("formatter.filetypes.toml").taplo,
        },

        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
        },
    },
})

vim.api.nvim_create_autocmd("BufWritePost", {
    group = lsp_keybinds.formatting_augroup,
    desc = "Format file on save",
    pattern = "*",
    command = "FormatWriteLock",
})

vim.keymap.set("n", "F", "<cmd>Format")
