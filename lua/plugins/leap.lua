local function setup()
    require("leap").add_default_mappings()
end

return {
    "ggandor/leap.nvim",
    config = setup,
}
