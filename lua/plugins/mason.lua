local M = {
	"williamboman/mason-lspconfig.nvim",

	dependencies = {
		{ "williamboman/mason.nvim"},
		"nvim-lua/plenary.nvim",
	},
}

M.servers = require("core.servers")

function M.config()
	require("mason").setup({
		ui = {
			border = "rounded",
		},
		ensure_installed = {
			"stylua",
			"eslint_d",
			"prettierd",
		},
	})
	require("mason-lspconfig").setup({
		ensure_installed = M.servers,
	})
end

return M
