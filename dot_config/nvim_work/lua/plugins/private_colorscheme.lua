return {
	-- add gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		opts = {
			contrast = "hard", -- "soft" or "medium"
		},
	},
	-- add tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = { style = "moon" },
	},

	-- add dracula
	-- { "Mofiqul/dracula.nvim" },

	--add catppuccin
	{ "catppuccin/nvim" },

	{ "rebelot/kanagawa.nvim" },

	-- Configure LazyVim to load gruvbox
	{
		"LazyVim/LazyVim",
		opts = {
			-- colorscheme = "catppuccin-mocha",
			colorscheme = "tokyonight",
			-- colorscheme = "dracula",
			-- colorscheme = "gruvbox",
		},
	},
}
