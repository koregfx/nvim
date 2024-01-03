return {
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "gg", mode = "n", ":LazyGit<CR>", { silent = true, noremap = true, desc = "LazyGit" } },
		},
	},

	{
		"windwp/nvim-ts-autotag",
		ft = {
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
			"tsx",
			"jsx",
			"rescript",
			"xml",
			"php",
			"markdown",
			"astro",
			"glimmer",
			"handlebars",
			"hbs",
		},
	},
	{
		"ThePrimeagen/vim-be-good",
	},
}
