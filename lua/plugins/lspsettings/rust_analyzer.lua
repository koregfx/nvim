return {
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
}
