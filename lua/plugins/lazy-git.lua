local M = {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>gg", mode = "n", ":LazyGit<CR>", { silent = true, noremap = true, desc = "LazyGit" } },
	},
}
return M
