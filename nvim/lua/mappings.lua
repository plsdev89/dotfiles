require "nvchad.mappings"

vim.api.nvim_del_keymap("n", "<leader>b")
vim.api.nvim_del_keymap("n", "<leader>h")
vim.api.nvim_del_keymap("n", "<leader>v")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map(
  "n",
  "<leader>bc",
  ':lua require("nvchad.tabufline").closeAllBufs()<CR>',
  { noremap = true, silent = true, desc = "Buffer Close all" }
)
