local mocha = require("catppuccin.palettes").get_palette("mocha")
local frappe = require("catppuccin.palettes").get_palette("frappe")
local mode_color = {
    n = mocha.blue,
    i = mocha.green,
    v = mocha.mauve,
    [""] = mocha.mauve,
    V = mocha.mauve,
    c = mocha.peach,
    no = mocha.red,
    s = mocha.peach,
    S = mocha.peach,
    [""] = mocha.peach,
    ic = mocha.yellow,
    R = mocha.lavender,
    Rv = mocha.lavender,
    cv = mocha.red,
    ce = mocha.red,
    r = mocha.blue,
    rm = mocha.blue,
    ["r?"] = mocha.blue,
    ["!"] = mocha.red,
    t = mocha.red,
}
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            theme = "catppuccin",
            component_separators = " ",
            section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_a = {
                {
                    function()
                        return " "
                    end,
                    color = function()
                        return { fg = mocha.crust, bg = mode_color[vim.fn.mode()] }
                    end,
                    padding = { right = 0, left = 0 },
                    separator = { left = "" },
                },
                {
                    "mode",
                    color = function()
                        return { bg = mocha.surface0, fg = mode_color[vim.fn.mode()] }
                    end,
                    separator = { right = "" },
                    padding = 1,
                },
                {
                    function()
                        return "　"
                    end,
                    padding = 0,
                    separator = {},
                    color = { bg = mocha.mantle },
                },
            },
            lualine_b = {
                {
                    "filetype",
                    colored = false,
                    icon_only = true,
                    separator = { left = "" },
                    icon = {
                        align = "left",
                        color = { fg = mocha.crust },
                    },
                    color = { fg = mocha.crust, bg = frappe.red },
                    padding = { right = 1 },
                },
                { "filename", color = { fg = frappe.red }, separator = { right = "", file_status = false } },
            },
            lualine_c = {
                { "branch" },
                {
                    "diff",
                    symbols = { added = " ", modified = "󰝤 ", removed = " " },
                },
            },

            lualine_x = {
                { "fileformat" },
                {
                    "diagnostics",
                    sections = { "error" },
                    diagnostics_color = { error = { fg = mocha.white } },
                },
                {
                    "diagnostics",
                    sections = { "warn" },
                    diagnostics_color = { warn = { fg = mocha.white } },
                },
            },
            lualine_y = { "filetype", "progress" },
            lualine_z = {
                { "location", separator = { right = "" } },
            },
        },
        inactive_sections = {
            lualine_a = { "filename" },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { "location" },
        },
        tabline = {},
        extensions = {},
    },
}
