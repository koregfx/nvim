local M = {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy', -- Or `LspAttach`
  priority = 1000, -- needs to be loaded in first
  opts = {
    options = {

      virtual_text = false,

      multilines = {
        enabled = true,
        always_show = true,
      },
    },
  },
}

return M
