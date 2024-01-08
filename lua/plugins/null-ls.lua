local M = {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
}

function M.config()
	local null_ls = require("null-ls")
	vim.lsp.buf.format({ timeout_ms = 2000 })
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.prettierd,
		},
	})
	vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
end

return M
