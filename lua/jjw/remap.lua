vim.g.mapleader = " "

vim.keymap.set("n", "i", "zzi")
vim.keymap.set("n", "I", "zzI")
vim.keymap.set("n", "a", "zza")
vim.keymap.set("n", "A", "zzA")
vim.keymap.set("n", "o", "zzo")
vim.keymap.set("n", "O", "zzO")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "Q", "q")
vim.keymap.del("n", "q")
vim.keymap.set("t", "<C-c>", [[<C-c><C-\><C-n>]])

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>dd", [["_d]])

vim.keymap.set("v", "K", "<CMD>m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", "<CMD>m '>+1<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-c>", "<CMD>noh<CR>")

vim.keymap.set("n", "<leader>x", "<CMD>!chmod -x %<CR>")
vim.keymap.set("n", "<leader>X", "<CMD>!chmod +x %<CR>")

vim.keymap.set("n", "<leader>lc", "<CMD>!pdflatex %<CR>")
