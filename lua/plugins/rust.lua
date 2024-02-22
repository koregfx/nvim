local M = {
	{
		"saecki/crates.nvim",
		ft = { "rust", "toml" },
		config = function()
			local crates = require("crates")
			crates.setup({})
			crates.show()
		end,
	},
	--[[ {
		"mrcjkb/rustaceanvim",
		init = function()
			local lspconfig = require("plugins.lsp-config")
			-- Configure rustaceanvim here
			vim.g.rustaceanvim = {
				-- Plugin configuration
				tools = {},
				-- LSP configuration
				server = {
					on_attach = lspconfig.on_attach,
					default_settings = {
						["rust-analyzer"] = {},
					},
				},
			}
		end,
		version = "^4", -- Recommended
		ft = { "rust" },
	}, ]]
}

return M

--[[ {
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
		config = function()
			local rt = require("rust-tools")
			local opts = { noremap = true, silent = true }
			local keymap = vim.api.nvim_buf_set_keymap
			rt.setup({
				server = {
					on_attach = function(_, bufnr)
						keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
						keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
						keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
						vim.keymap.set(
							"n",
							"<leader>k",
							vim.lsp.buf.signature_help,
							{ noremap = true, silent = true, buffer = bufnr }
						)
						keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
						keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
						keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
						-- Hover actions
						vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
						-- Code action groups
						vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
					end,
					settings = {
						["rust-analyzer"] = {
							assist = {
								importEnforceGranularity = true,
								importPrefix = "create",
							},
							cache = {
								warmup = false,
							},
							cachePriming = {
								enable = false,
							},
							cargo = {
								allFeatures = true,
								buildScripts = {
									enable = true,
								},
							},
							completion = {
								autoimport = {
									enable = true,
								},
							},
							diagnostics = {
								experimental = {
									enable = true,
								},
							},
							imports = {
								granularity = {
									group = "module",
								},
								prefix = "self",
							},
							procMacros = {
								enable = true,
							},
						},
					},
					diagnostics = {
						enable = true,
						experimental = {
							enable = true,
						},
					},
				},
			})
			rt.inlay_hints.enable()
		end,
	},
]]
