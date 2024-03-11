local mocha = require('catppuccin.palettes').get_palette 'mocha'
local frappe = require('catppuccin.palettes').get_palette 'frappe'
local icons = require 'kore.icons'
local mode_color = {
  n = mocha.blue,
  i = mocha.green,
  v = mocha.mauve,
  [''] = mocha.mauve,
  V = mocha.mauve,
  c = mocha.peach,
  no = mocha.red,
  s = mocha.peach,
  S = mocha.peach,
  [''] = mocha.peach,
  ic = mocha.yellow,
  R = mocha.lavender,
  Rv = mocha.lavender,
  cv = mocha.red,
  ce = mocha.red,
  r = mocha.blue,
  rm = mocha.blue,
  ['r?'] = mocha.blue,
  ['!'] = mocha.red,
  t = mocha.red,
}
local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'catppuccin',
      component_separators = ' ',
      section_separators = { left = icons.ui.BoldDividerLeft, right = icons.ui.BoldDividerRight },
    },
    sections = {
      lualine_a = {
        {
          function()
            return '　'
          end,
          padding = 0,
          separator = {},
          color = { bg = mocha.mantle },
        },
        {
          function()
            return icons.misc.Nvim .. ' '
          end,
          color = function()
            return { fg = mocha.crust, bg = mode_color[vim.fn.mode()] }
          end,
          padding = { right = 0, left = 0 },
          separator = { left = icons.ui.BoldDividerLeft },
        },
        {
          'mode',
          color = function()
            return { bg = mocha.surface0, fg = mode_color[vim.fn.mode()] }
          end,
          separator = { right = icons.ui.BoldDividerRight },
          padding = 1,
        },
        {
          function()
            return '　'
          end,
          padding = 0,
          separator = {},
          color = { bg = mocha.mantle },
        },
      },
      lualine_b = {
        {
          'filetype',
          colored = false,
          icon_only = true,
          separator = { left = icons.ui.BoldDividerLeft },
          icon = {
            align = 'left',
            color = { fg = mocha.crust },
          },
          color = { fg = mocha.crust, bg = frappe.red },
          padding = { right = 1 },
        },
        {
          'filename',
          color = { fg = frappe.red },
          separator = { right = icons.ui.BoldDividerRight, file_status = false },
        },
      },
      lualine_c = {
        { 'branch' },
        {
          'diff',
          symbols = {
            added = icons.git.LineAdded,
            modified = icons.git.LineModified,
            removed = icons.git.LineRemoved,
          },
        },
      },
      lualine_x = {
        { 'fileformat' },
        { 'diagnostics' },
      },

      lualine_y = {
        {
          function()
            return icons.ui.Gear .. ' '
          end,
          color = function()
            return { fg = mocha.crust, bg = mocha.green, gui = 'bold' }
          end,
          padding = { right = 0, left = 0 },
          separator = { left = icons.ui.BoldDividerLeft },
        },
        {
          function()
            local msg = 'No Active Lsp'
            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then
              return msg
            end
            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
              end
            end
            return msg
          end,
          separator = { right = icons.ui.BoldDividerRight },
          color = { fg = mocha.green, gui = 'bold' },
        },
        {
          function()
            return '　'
          end,
          padding = 0,
          separator = {},
          color = { bg = mocha.mantle },
        },
      },
      lualine_z = {
        {
          function()
            return icons.ui.ActiveFolder .. ' '
          end,
          color = function()
            return { fg = mocha.crust, bg = mocha.red, gui = 'bold' }
          end,
          padding = { right = 0, left = 0 },
          separator = { left = icons.ui.BoldDividerLeft },
        },
        {
          function()
            local path = vim.loop.cwd()
            local path_table = require('kore.helpers').split(path, '/')
            return path_table[#path_table]
          end,
          path = 2,
          mode = 2,
          separator = { right = icons.ui.BoldDividerRight },
          color = { fg = mocha.red, bg = mocha.surface0, gui = 'bold' },
        },
        {
          function()
            return '　'
          end,
          padding = 0,
          separator = {},
          color = { bg = mocha.mantle },
        },

        {
          function()
            return icons.kind.Keyword .. ' '
          end,
          color = { fg = mocha.crust, bg = mocha.peach, gui = 'bold' },
          padding = { right = 0, left = 0 },
          separator = { left = icons.ui.BoldDividerLeft },
        },
        {
          'location',
          separator = { right = icons.ui.BoldDividerRight },
          color = { fg = mocha.peach, bg = mocha.surface0 },
        },
        {
          function()
            return '　'
          end,
          padding = 0,
          separator = {},
          color = { bg = mocha.mantle },
        },
      },
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
  },
}

return M
