local function setup()
    local todo_comments = require("todo-comments")

    todo_comments.setup({
        signs = true,
        sign_priority = 8,
        keywords = {
            FIX = {
                icon = "F ",
                color = "error",
                alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
            },
            TODO = { icon = "I ", color = "info" },
            HACK = { icon = "H ", color = "warning", alt = { "HACKFIX" } },
            WARN = { icon = "W ", color = "warning", alt = { "WARNING" } },
            PERF = { icon = "P ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            NOTE = { icon = "N ", color = "hint", alt = { "INFO" } },
            TEST = {
                icon = "T ",
                color = "test",
                alt = { "TESTING", "PASSED", "FAILED" },
            },
        },
    })

    vim.keymap.set(
        "n",
        "<leader>do",
        "<cmd>TodoTelescope<cr>",
        { silent = true, noremap = true }
    )
    vim.keymap.set("n", "]t", function()
        todo_comments.jump_next()
    end)

    vim.keymap.set("n", "[t", function()
        todo_comments.jump_prev()
    end)
end

return {
    "folke/todo-comments.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
    config = setup,
}
