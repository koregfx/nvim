return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		fast_wrap = {
			map = "<M-e>",
			chars = { "{", "[", "(", '"', "'" },
			pattern = [=[[%'%"%>%]%)%}%,]]=],
			end_key = "$",
			cursor_pos_before = true,
			keys = "qwertyuiopzxcvbnmasdfghjkl",
			highlight = "Search",
			highlight_grey = "Comment",
		},
	},
}
