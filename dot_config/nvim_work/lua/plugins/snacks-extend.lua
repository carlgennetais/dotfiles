return {
	"folke/snacks.nvim",
	opts = {
		picker = {
			sources = {
				files = {
					follow = true, -- Always follow symlinks when searching files
				},
				explorer = {
					hidden = false,
					ignored = false,
					layout = { layout = { width = 35, min_width = 20 } },
				},
				lsp_symbols = { -- in quarto files, allow symbols search
					filter = {
						quarto = true,
					},
				},
			},
		},
	},
}
