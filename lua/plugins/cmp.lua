local M = {
	-- Autocompletion
	"hrsh7th/nvim-cmp",
  event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",

		-- Adds LSP completion capabilities
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-emoji",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lua",
		"onsails/lspkind.nvim",
		-- Adds a number of user-friendly snippets
		"rafamadriz/friendly-snippets",
	},
}

function M.config()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local lspkind = require("lspkind")
	require("luasnip.loaders.from_vscode").lazy_load()

	local check_backspace = function()
		local col = vim.fn.col(".") - 1
		return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
	end

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		completion = {
			completeopt = "menu,menuone,noinsert",
		},
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete({})),
			["<C-e>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			-- Accept currently selected item. If none selected, `select` first item.
			-- Set `select` to `false` to only confirm explicitly selected items.
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expandable() then
					luasnip.expand()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif check_backspace() then
					fallback()
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
		}),
		---@diagnostic disable-next-line: missing-fields
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = 50,
				ellipsis_char = "...",
				symbol_map = {},
			}),
			-- return require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
		},
		sources = {
			{
				name = "nvim_lsp",
				entry_filter = function(entry, ctx)
					local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
					if kind == "Snippet" and ctx.prev_context.filetype == "java" then
						return false
					end

					if ctx.prev_context.filetype == "markdown" then
						return true
					end

					if kind == "Text" then
						return false
					end

					return true
				end,
			},
			{ name = "luasnip" },
			{ name = "nvim_lua" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "calc" },
			{ name = "emoji" },
			{ name = "treesitter" },
			{ name = "crates" },
			{ name = "tmux" },
		},
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		window = {
			completion = {
				border = "rounded",
				col_offset = -3,
				side_padding = 1,
				scrollbar = false,
				scrolloff = 8,
			},
			documentation = {
				border = "rounded",
			},
		},
		experimental = {
			ghost_text = true,
		},
	})

	pcall(function()
		local function on_confirm_done(...)
			require("nvim-autopairs.completion.cmp").on_confirm_done()(...)
		end
		require("cmp").event:off("confirm_done", on_confirm_done)
		require("cmp").event:on("confirm_done", on_confirm_done)
	end)
end

return M
