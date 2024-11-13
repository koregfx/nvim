local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
local term_ops = { silent = true }

keymap('n', '<space>', '<nop>', opts)
-- Save File
keymap('n', '<C-s>', ':w<CR>', {})
-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

keymap('n', '<C-d>', '<C-d>zz', opts)
keymap('n', '<C-u>', '<C-u>zz', opts)
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)

keymap('n', '<A-h>', [[<cmd>vertical resize +5<cr>]], opts)
keymap('n', '<A-j>', [[<cmd>vertical resize +5<cr>]], opts)
keymap('n', '<A-k>', [[<cmd>vertical resize -5<cr>]], opts)
keymap('n', '<A-l>', [[<cmd>vertical resize -5<cr>]], opts)

-- Ident mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

keymap('n', '<A-j>', ':m +1<CR>==', opts)
keymap('n', '<A-k>', ':m -2<CR>==', opts)

keymap('v', 'p', '"_dP', opts)

keymap('n', 'd', '"_d', opts)
keymap('v', 'd', '"_d', opts)

keymap('n', '<leader>no', '<cmd>noh<CR>', opts)

vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- -- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- -- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
