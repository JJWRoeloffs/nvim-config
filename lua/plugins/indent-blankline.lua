local function setup()
    vim.opt.list = true
    require("indent_blankline").setup()
end

return {
    "lukas-reineke/indent-blankline.nvim",
    config = setup,
}
