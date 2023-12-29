return {
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys= {
            {"gg",mode = "n", ":LazyGit<CR>", {silent = true, noremap = true, desc = 'LazyGit'}}
        },
    },
}
