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
local function split(pString, pPattern)
	local Table = {} -- NOTE: use {n = 0} in Lua-5.0
	local fpat = "(.-)" .. pPattern
	local last_end = 1
	local s, e, cap = pString:find(fpat, 1)
	while s do
		if s ~= 1 or cap ~= "" then
			table.insert(Table, cap)
		end
		last_end = e + 1
		s, e, cap = pString:find(fpat, last_end)
	end
	if last_end <= #pString then
		cap = pString:sub(last_end)
		table.insert(Table, cap)
	end
	return Table
end
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
						return "　"
					end,
					padding = 0,
					separator = {},
					color = { bg = mocha.mantle },
				},
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
					symbols = { added = " ", modified = "󱨇 ", removed = " " },
				},
			},
			lualine_x = {
				{ "fileformat" },
				{ "diagnostics" },
			},

			lualine_y = {
				{
					function()
						return " "
					end,
					color = function()
						return { fg = mocha.crust, bg = mocha.green, gui = "bold" }
					end,
					padding = { right = 0, left = 0 },
					separator = { left = "" },
				},
				{
					function()
						local msg = "No Active Lsp"
						local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
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
					separator = { right = "" },
					color = { fg = mocha.green, gui = "bold" },
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
			lualine_z = {
				{
					function()
						return " "
					end,
					color = function()
						return { fg = mocha.crust, bg = mocha.red, gui = "bold" }
					end,
					padding = { right = 0, left = 0 },
					separator = { left = "" },
				},
				{
					function()
						local path = vim.loop.cwd()
						local path_table = split(path, "\\")
						return path_table[#path_table]
					end,
					path = 2,
					mode = 2,
					separator = { right = "" },
					color = { fg = mocha.red, bg = mocha.surface0, gui = "bold" },
				},
				{
					function()
						return "　"
					end,
					padding = 0,
					separator = {},
					color = { bg = mocha.mantle },
				},

				{
					function()
						return " "
					end,
					color = { fg = mocha.crust, bg = mocha.peach, gui = "bold" },
					padding = { right = 0, left = 0 },
					separator = { left = "" },
				},
				{
					"location",
					separator = { right = "" },
					color = { fg = mocha.peach, bg = mocha.surface0 },
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
