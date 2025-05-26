vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw" })

vim.keymap.set("n", "<M-f>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
vim.keymap.set("n", "<M-d>",  "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting register" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down and format" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up and format" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>p", [["+p]], { desc = "Paste from clipboard" })

vim.keymap.set("n", "<leader>wr", "<cmd>vertical resize 106<CR>", { desc = "Window resize" })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })
