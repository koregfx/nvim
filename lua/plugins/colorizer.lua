return {
  'NvChad/nvim-colorizer.lua',
  opts = {
    filetypes = { '*' },
    user_default_options = {
      mode = 'background', -- Set the display mode.
      -- Available methods are false / true / "normal" / "lsp" / "both"
      -- True is same as normal
      tailwind = true, -- Enable tailwind colors
      -- parsers can contain values used in |user_default_options|
      sass = { enable = false, parsers = { 'css' } }, -- Enable sass colors
      virtualtext = '■',
    },
  },
}
