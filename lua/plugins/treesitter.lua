local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
}
function M.config()
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		highlight = { enable = true },
		indent = { enable = true },
		autotag = {
			enable = true,
		},
		ensure_installed = {
			"regex",
			"bash",
      "rust",
      "c_sharp",
      "astro",
      "css",
      "dockerfile",
      "dot",
      "lua",
      "sql",
      "toml",
      "typescript",
      "javascript",
      "markdown",
			"markdown_inline",
		},
	})
end

return M
