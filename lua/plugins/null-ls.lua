local M = {
  'nvimtools/none-ls.nvim',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
}

function M.config()
  local null_ls = require 'null-ls'
  null_ls.setup {
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettierd,
    },
  }
  vim.keymap.set('n', '<leader>gf', function()
    vim.lsp.buf.format { timeout_ms = 2000 }
  end, {})
end

return M
