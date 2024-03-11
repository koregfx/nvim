local M = { -- nvim v0.8.0
  'kdheepak/lazygit.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  keys = {
    { '<leader>gg', mode = 'n', ':LazyGit<CR>', { silent = true, noremap = true, desc = 'LazyGit' } },
  },
  config = function()
    vim.g.lazygit_floating_window_use_plenary = 1
  end,
}
return M
