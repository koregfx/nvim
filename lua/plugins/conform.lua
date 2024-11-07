local M = { -- Autoformat
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'first',
      filter = function(client)
        return client.name == 'eslint'
      end,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      typescript = { { 'prettierd', 'prettier', 'eslint' } },
      typescriptreact = { { 'prettierd', 'prettier', 'eslint' } },
      javascript = { { 'prettierd', 'prettier', 'eslint' } },
      javascriptreact = { { 'prettierd', 'prettier', 'eslint' } },
      json = { { 'jq' } },
    },
  },
}

return M
