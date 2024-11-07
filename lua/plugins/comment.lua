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
  vim.keymap.set('n', '<leader>cl', api.toggle.linewise.current, {})
  vim.keymap.set('v', '<leader>cb', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.linewise(vim.fn.visualmode())
  end)
  vim.keymap.set('x', '<leader>cb', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.blockwise(vim.fn.visualmode())
  end)

  vim.keymap.set('v', '<leader>cl', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.linewise(vim.fn.visualmode())
  end)
  vim.keymap.set('x', '<leader>cl', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.linewise(vim.fn.visualmode())
  end)
end

return M
