local M = {
  'numToStr/Comment.nvim',
  opts = {
    mappings = {
      basic = false,
      extra = false,
    },
  },
  lazy = false,
}
function M.config()
  require('Comment').setup()
  local api = require 'Comment.api'
  local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)

  --For Nvim
  vim.keymap.set('n', '<C-_>', api.toggle.linewise.current, {})
  vim.keymap.set('v', '<C-_>', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.linewise(vim.fn.visualmode())
  end)
  vim.keymap.set('x', '<C-_>', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.blockwise(vim.fn.visualmode())
  end)

  --For neovide
  if vim.g.neovide then
    vim.keymap.set('n', '<C-/>', api.toggle.linewise.current)
    vim.keymap.set('v', '<C-/>', function()
      vim.api.nvim_feedkeys(esc, 'nx', false)
      api.toggle.linewise(vim.fn.visualmode())
    end)
    vim.keymap.set('x', '<C-/>', function()
      vim.api.nvim_feedkeys(esc, 'nx', false)
      api.toggle.blockwise(vim.fn.visualmode())
    end)
  end
end

return M
