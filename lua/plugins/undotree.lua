local function setup()
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

    vim.opt.swapfile = false
    vim.opt.backup = false
    vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
    vim.opt.undofile = true
    vim.opt.undofile = true
end

return {
    "mbbill/undotree",
    config = setup,
}
