local function setup()
    vim.keymap.set({ "n", "x", "o" }, "<leader>s", "<Plug>(leap-forward)")
    vim.keymap.set({ "n", "x", "o" }, "<leader>S", "<Plug>(leap-backward)")
    vim.keymap.set({ "n", "x", "o" }, "<leader>gs", "<Plug>(leap-backward)")
end

return {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = setup,
}
