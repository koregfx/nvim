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
  vim.keymap.set('n', '<leader>cc', api.toggle.linewise.current, {})
  vim.keymap.set('v', '<leader>cc', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.linewise(vim.fn.visualmode())
  end)
  vim.keymap.set('x', '<leader>cc', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.blockwise(vim.fn.visualmode())
  end)
end

return M
