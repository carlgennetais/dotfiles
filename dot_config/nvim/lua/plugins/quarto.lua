return {
	{
		-- for lsp features in code cells / embedded code
		"jmbuhr/otter.nvim",
		enabled = true,
		dev = false,
		ft = { "quarto", "markdown" },
		opts = {
			verbose = {
				no_code_found = false,
			},
		},
	},
	{
		"quarto-dev/quarto-nvim",
		dev = false,
		opts = {
			lspFeatures = {
				enabled = true,
				chunks = "fenced",
				languages = { "python", "bash", "html" },
				diagnostics = {
					enabled = true,
					triggers = { "BufWritePost" },
				},
				completion = {
					enabled = true,
				},
			},
			codeRunner = {
				enabled = true,
				default_method = "molten",
				never_run = { "yaml" }, -- filetypes which are never sent to a code runner
			},
		},
	},
	{
		-- when opening a ipynb, automatically convert it to a qmd
		"GCBallesteros/jupytext.nvim",
		opts = {
			custom_language_formatting = {
				python = {
					extension = "qmd",
					style = "quarto",
					force_ft = "quarto", -- you can set whatever filetype you want here
				},
			},
		},
	},
	-- {
	-- 	"rafamadriz/friendly-snippets",
	-- 	opts = {
	-- 		filetype_extend = { quarto = { "python", "markdown" } }, -- extend markdown snippets to quarto
	-- 	},
	-- },
}
