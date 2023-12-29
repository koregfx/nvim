return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")
    local api = require "nvim-tree.api"
    nvimtree.setup({})
		vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", { silent = true })
    api.tree.open()

	end,
}
