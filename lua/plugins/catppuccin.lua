local M = {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  lazy = false,
}

function M.config()
  vim.cmd.colorscheme 'catppuccin'
end

return {}
