return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				sql = { "sqlfmt" },
				mysql = { "sqlfmt" },
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		opts = {
			linters = {
				sqlfluff = { "format", "--dialect=mariadb", "-" },
			},
		},
	},
}
