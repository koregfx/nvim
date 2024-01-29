local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
}
function M.config()
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
		autotag = {
			enable = true,
		},
	})
end

return M
