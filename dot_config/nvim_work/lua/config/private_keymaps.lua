-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local runner = require("quarto.runner")
local wk = require("which-key")
local icons = require("mini.icons")
-- local nb = require("neopyter.jupyter").notebook
wk.add({
	{
		-- navigation
		-- Ctrl+PageUp/PageDown to change tabs (QMK capslock + e/r)
		{ "<C-PageUp>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "<C-PageDown>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },

		{ "<M-h>", "zH", desc = "Scroll left horizontally" },
		{ "<M-l>", "zL", desc = "Scroll right horizontally" },
	},
	-- {
	-- 	-- Neopyter keymaps
	{ "<leader>j", group = "ipynb", icon = icons.get("extension", "ipynb") },

	{ "<leader>jL", ":QuartoSendLine<cr>", desc = "run quarto line" },
	{ "<leader>jQ", ":QuartoSend<cr>", desc = "run quarto cell" },

	-- git
	{
		"<leader>gm",
		function()
			Snacks.picker.git_branches()
		end,
		desc = "Git Branches",
	},

	-- dbt
	{
		"<leader>jp",
		function()
			local current_dir = vim.fn.expand("%:p:h") -- Get current file's directory
			local filename = vim.fn.expand("%:t:r") -- Get filename without extension
			local properties_file = current_dir .. "/properties/" .. filename .. ".yml"
			vim.cmd.edit(properties_file)
		end,
		desc = "Open dbt properties file",
	},
	{
		-- can also use <leader><Space> and C-R C-W
		-- related : <leader>sw to grep word under cursor
		"<leader>sx",
		function()
			local word = vim.fn.expand("<cword>")
			Snacks.picker.git_files({
				pattern = word,
				auto_confirm = true,
			})
		end,
		desc = "Search filename under cursor",
	},
})
