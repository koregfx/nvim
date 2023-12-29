local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
local term_ops = { silent = true }

-- Save File
keymap("n", "<C-s>", ":w<CR>", {})
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Ident mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "<A-j>", ":m '>+1<CR>gv-gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv-gv", opts)

keymap("n", "<A-j>", ":m +1<CR>==", opts)
keymap("n", "<A-k>", ":m -2<CR>==", opts)

keymap("v", "p", '"_dP', opts)
