local map = vim.keymap.set

-- Clear search highlight on Esc
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- jk to exit insert mode
map("i", "kj", "<Esc>", { desc = "Exit insert mode" })

-- Move current line
map("n", "<leader>j", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<leader>k", ":m .-2<CR>==", { desc = "Move line up" })

-- Move selected lines
map("v", "<leader>j", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<leader>k", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
