return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			marksman = {
				filetypes = { "markdown", "quarto" },
			},
			bashls = {
				filetypes = { "sh", "zsh" },
			},
			sqlls = {
				enabled = true,
				root_dir = function()
					return vim.loop.cwd()
				end,
			},
			pyright = {
				settings = {
					python = {
						analysis = {
							diagnosticSeverityOverrides = {
								-- don't show warning for unused variables (at the end of a notebook cell)
								reportUnusedExpression = "none",
							},
						},
					},
				},
			},
		},
	},
}
