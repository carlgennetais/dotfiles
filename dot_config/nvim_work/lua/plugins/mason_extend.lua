return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = { "ty" },
	},
	automatic_enable = {
		exclude = { "pyright" },
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
