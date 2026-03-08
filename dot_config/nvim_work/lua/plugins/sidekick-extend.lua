return {
	{
		"folke/sidekick.nvim",
		opts = {
			cli = {
				prompts = {
					commit = "/commit-commands:commit",
				},
				-- win = {
				-- 	split = {
				-- 		width = 65,
				-- 	},
				-- },
			},
		},
		keys = {
			{
				"<leader>aa",
				function()
					require("sidekick.cli").toggle({ name = "claude", focus = true })
				end,
				desc = "Sidekick Claude Toggle",
				mode = { "n", "v" },
			},
		},
	},
}
