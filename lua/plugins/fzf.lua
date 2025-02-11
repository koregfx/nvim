local M = {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
}

function M.config()
  local keymap = vim.keymap
  keymap.set('n', '<leader>p', require('fzf-lua').files, { desc = 'FZF Files' })
  keymap.set('n', '<leader><leader>', require('fzf-lua').resume, { desc = 'FZF Resume' })
  keymap.set('n', '<leader>r', require('fzf-lua').registers, { desc = 'Registers' })
  keymap.set('n', '<leader>m', require('fzf-lua').marks, { desc = 'Marks' })
  keymap.set('n', '<leader>k', require('fzf-lua').keymaps, { desc = 'Keymaps' })
  keymap.set('n', '<leader>f', require('fzf-lua').live_grep, { desc = 'FZF Grep' })
  keymap.set('n', '<leader>b', require('fzf-lua').buffers, { desc = 'FZF Buffers' })
  keymap.set('v', '<leader>8', require('fzf-lua').grep_visual, { desc = 'FZF Selection' })
  keymap.set('n', '<leader>7', require('fzf-lua').grep_cword, { desc = 'FZF Word' })
  keymap.set('n', '<leader>j', require('fzf-lua').helptags, { desc = 'Help Tags' })
  keymap.set('n', '<leader>gc', require('fzf-lua').git_bcommits, { desc = 'Browse File Commits' })
  keymap.set('n', '<leader>gs', require('fzf-lua').git_status, { desc = 'Git Status' })
  keymap.set('n', '<leader>s', require('fzf-lua').spell_suggest, { desc = 'Spelling Suggestions' })
  keymap.set('n', '<leader>cj', require('fzf-lua').lsp_definitions, { desc = 'Jump to Definition' })
  keymap.set('n', '<leader>cs', ":lua require'fzf-lua'.lsp_document_symbols({winopts = {preview={wrap='wrap'}}})<cr>", { desc = 'Document Symbols' })
  keymap.set('n', '<leader>cr', require('fzf-lua').lsp_references, { desc = 'LSP References' })
  keymap.set('n', '<leader>cd', ":lua require'fzf-lua'.diagnostics_document({fzf_opts = { ['--wrap'] = true }})<cr>", { desc = 'Document Diagnostics' })
  keymap.set(
    'n',
    '<leader>ca',
    ":lua require'fzf-lua'.lsp_code_actions({ winopts = {relative='cursor',row=1.01, col=0, height=0.2, width=0.4} })<cr>",
    { desc = 'Code Actions' }
  )
end

return M
