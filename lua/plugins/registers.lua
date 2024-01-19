local function setup()
    local registers = require("registers")
    registers.setup({
        trim_whitespace = false,
        bind_keys = {
            normal = registers.show_window({ mode = "motion" }),
            visual = registers.show_window({ mode = "motion" }),
            insert = registers.show_window({ mode = "insert" }),

            -- When pressing the key of a register, apply it with a very small delay, which will also highlight the selected register
            registers = registers.apply_register({ delay = 0.1 }),

            -- Immediately apply the selected register line when pressing the return key
            ["<CR>"] = registers.apply_register(),
            -- Close the registers window when pressing the Esc key
            ["<Esc>"] = registers.close_window(),
            -- Move the cursor in the registers window down when pressing <C-j>
            ["<C-j>"] = registers.move_cursor_down(),
            ["<Down>"] = registers.move_cursor_down(),
            -- Move the cursor in the registers window up when pressing <C-k>
            ["C-k"] = registers.move_cursor_up(),
            ["<Up>"] = registers.move_cursor_up(),

            -- Clear the register of the highlighted line when pressing <DeL>
            ["<Del>"] = registers.clear_highlighted_register(),
            -- Clear the register of the highlighted line when pressing <BS>
            ["<BS>"] = registers.clear_highlighted_register(),
        },
        window = {
            max_width = 89,
            transparency = 0,
        },
    })
end

return {
    "tversteeg/registers.nvim",
    name = "registers",
    keys = {
        { '"', mode = { "n", "v" } },
        { "<C-R>", mode = "i" },
    },
    config = setup,
}
