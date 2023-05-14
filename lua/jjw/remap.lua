vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

vim.keymap.set("n", "i", "zzi")
vim.keymap.set("n", "I", "zzI")
vim.keymap.set("n", "a", "zza")
vim.keymap.set("n", "A", "zzA")
vim.keymap.set("n", "o", "zzo")
vim.keymap.set("n", "O", "zzO")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "Q", "q")
vim.keymap.set("n", "q", "<Nop>")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-c>", ":noh<CR>")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod -x %<CR>")
vim.keymap.set("n", "<leader>X", "<cmd>!chmod x %<CR>")
