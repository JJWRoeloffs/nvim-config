local function setup()
    vim.opt.fillchars:append({ diff = "╱" })

    local command = vim.api.nvim_create_user_command

    local actions = require("diffview.actions")
    local arg_parser = require("diffview.arg_parser")
    local diffview = require("diffview")

    diffview.setup({
        use_icons = false,
        view = {
            default = {
                winbar_info = true,
            },
            merge_tool = {
                disable_diagnostics = false,
                winbar_info = true,
            },
            file_history = {
                winbar_info = true,
            },
        },
        keymaps = {
            diff1 = {
                -- Mappings in single window diff layouts
                {
                    "n",
                    "g?",
                    actions.help({ "view", "diff1" }),
                    { desc = "Open the help panel" },
                },
            },
            diff2 = {
                -- Mappings in 2-way diff layouts
                {
                    "n",
                    "g?",
                    actions.help({ "view", "diff2" }),
                    { desc = "Open the help panel" },
                },
            },
            diff3 = {
                -- Mappings in 3-way diff layouts
                {
                    "n",
                    "g?",
                    actions.help({ "view", "diff3" }),
                    { desc = "Open the help panel" },
                },
            },
            diff4 = {
                -- Mappings in 4-way diff layouts
                {
                    "n",
                    "g?",
                    actions.help({ "view", "diff4" }),
                    { desc = "Open the help panel" },
                },
            },
            file_history_panel = {
                {
                    "n",
                    "g?",
                    actions.help("option_panel"),
                    { desc = "Open the help panel" },
                },
            },
            help_panel = {
                { "n", "q", actions.close, { desc = "Close help menu" } },
                { "n", "<esc>", actions.close, { desc = "Close help menu" } },
            },
        },
    })

    command("Dq", function()
        diffview.close()
    end, { nargs = 0, bang = true })

    command("Df", function(ctx)
        local range

        if ctx.range > 0 then
            range = { ctx.line1, ctx.line2 }
        end

        diffview.file_history(range, arg_parser.scan(ctx.args).args)
    end, { nargs = "*", complete = diffview.completion, range = true })

    command("Do", function(ctx)
        diffview.open(arg_parser.scan(ctx.args).args)
    end, { nargs = "*", complete = diffview.completion })
end

return {
    "sindrets/diffview.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
    cmd = { "Do", "Df" },
    config = setup,
}
