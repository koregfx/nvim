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
  require('Comment').setup {
    toggler = {
      line = "<C-'>",
      block = '<C-/>',
    },
    opleader = {
      line = "<C-'>",
      block = '<C-/>',
    },
  }
end

return M
