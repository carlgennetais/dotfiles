return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		-- option to keep html comments visible in markdown files (presenter notes)
		ft = { "markdown", "quarto" },
		opts = {
			html = {
				enabled = true,
				comment = {
					conceal = false,
				},
			},
			code = {
				enabled = false,
				style = "none",
			},
		},
	},
	-- Plugin to create next list item in markdown
	{
		"bullets-vim/bullets.vim",
		init = function()
			vim.g.bullets_enabled_file_types = { "markdown", "quarto", "text", "gitcommit" }
		end,
	},
}
