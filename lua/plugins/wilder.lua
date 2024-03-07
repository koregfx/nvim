--[[ local M = {
  'gelguy/wilder.nvim',
}

function M.config()
  local wilder = require 'wilder'
  -- wilder.set_option('use_python_remote_plugin', 0)
  local macchiato = require('catppuccin.palettes').get_palette 'macchiato'

  -- Create a highlight group for the popup menu
  local text_highlight = wilder.make_hl('WilderText', { { a = 1 }, { a = 1 }, { foreground = macchiato.text } })
  local mauve_highlight = wilder.make_hl('WilderMauve', { { a = 1 }, { a = 1 }, { foreground = macchiato.mauve } })

  -- Enable wilder when pressing :, / or ?
  wilder.setup { modes = { ':', '/', '?' } }

  -- Enable fuzzy matching for commands and buffers
  wilder.set_option(
    'renderer',
    wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
      highlighter = wilder.basic_highlighter(),
      highlights = {
        default = text_highlight,
        border = mauve_highlight,
        accent = mauve_highlight,
      },
      left = { ' ', wilder.popupmenu_devicons() },
      right = { ' ', wilder.popupmenu_scrollbar() },
      min_width = '100%', -- minimum height of the popupmenu, can also be a number
      min_height = '50%', -- to set a fixed height, set max_height to the same value
      reverse = 0, -- if 1, shows the candidates from bottom to top
    })
  )
end
]]
return {} 
