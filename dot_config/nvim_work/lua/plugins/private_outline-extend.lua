return {
	"hedyhli/outline.nvim",
	opts = {
		outline_window = {
			width = 15,
			position = "right",
		},
		providers = {
			priority = { "markdown", "lsp", "coc", "norg", "man" },
			markdown = {
				-- List of supported ft's to use the markdown provider
				filetypes = { "markdown", "quarto" },
				-- TODO: enable outline in qmd files
			},
		},
	},
	-- init = function()
	-- 	vim.api.nvim_create_autocmd("VimEnter", {
	-- 		callback = function()
	-- 			-- Small delay to ensure proper window arrangement
	-- 			vim.cmd("Outline")
	-- 			vim.defer_fn(function()
	-- 				vim.cmd("wincmd h") -- Return to main window
	-- 			end, 200)
	-- 		end,
	-- 	})
	-- end,
}
