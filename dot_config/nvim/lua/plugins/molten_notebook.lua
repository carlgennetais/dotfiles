return {
	{
		"benlubas/molten-nvim",
		enabled = true,
		-- dependencies = { "3rd/image.nvim" },
		build = ":UpdateRemotePlugins",
		init = function()
			vim.g.molten_auto_open_output = false -- use MotenEnterOutput to open output again
			vim.g.molten_cover_empty_lines = true
			vim.g.molten_cover_lines_starting_with = { "# %%", "```", "```{python}" }
			-- vim.g.molten_image_provider = "image.nvim" -- TODO: replace with snacks.image
			vim.g.molten_virt_lines_off_by_1 = false
			vim.g.molten_virt_text_output = true -- allow output to be always visible
			vim.g.molten_virt_text_max_lines = 25
			vim.g.molten_wrap_output = false -- wrapping for virt text and the output window
			vim.g.molten_output_show_exec_time = true
			vim.g.molten_output_show_more = false
			vim.g.molten_auto_open_html_in_browser = false
			vim.g.molten_open_cmd = "google-chrome" -- INFO: firefox is a snap package, has no access to /tmp. sushi has bad encoding
			vim.g.molten_use_border_highlights = true
			vim.api.nvim_set_hl(0, "MoltenCell", {}) -- disable cell highlighting
		end,
		keys = {
			-- kernel
			-- { "<leader>ji", ":MoltenInit<CR>", desc = "Init kernel" },
			{
				"<leader>ji",
				function()
					local venv = os.getenv("VIRTUAL_ENV")
					if venv ~= nil then
						-- gets the name of the virtual environment
						venv = string.match(venv, "/.+/(.+)/.+")
						-- supposing a kernel was created with the same name as the virtual environment
						vim.cmd(("MoltenInit %s"):format(venv))
					else
						vim.cmd("MoltenInit python3")
					end
				end,
				desc = "Init kernel",
			},
			{ "<leader>jS", ":MoltenDeinit<CR>gg", desc = "Stop kernel" },
			{ "<leader>jI", ":MoltenInterrupt<CR>", desc = "Interrupt kernel" },
			{ "<leader>jR", ":MoltenRestart!<CR>gg", desc = "Restart kernel and delete outputs" },
			-- evaluate
			-- { "<C-Enter>", ":MoltenEvaluateLine<CR>", desc = "Evaluate line" },
			{ "<C-Enter>", ":<C-u>MoltenEvaluateVisual<CR>gv", mode = "v", desc = "Evaluate visual selection" },
			-- { "<leader>jr", ":MoltenReevaluateCell<CR>", desc = "Re-evaluate cell" },
			{ "<leader>jl", ":MoltenEvaluateLine<CR>", desc = "Evaluate line" },
			-- output
			{
				"<leader>jo",
				":noautocmd MoltenEnterOutput<CR>:noautocmd MoltenEnterOutput<CR>",
				desc = "Enter output",
			},
			{ "<leader>jO", ":noautocmd MoltenEnterOutput<CR>", desc = "Show output" },
			{ "<leader>jd", ":MoltenDelete<CR>", desc = "Delete cell output" },
			{ "<leader>jD", ":MoltenDelete!<CR>", desc = "Delete all cell outputs" },
			{ "<leader>jb", ":MoltenOpenInBrowser<CR>", desc = "Open output in browser" },
			-- { "<leader>jh", ":MoltenHideOutput<CR>", "Hide output" },
		},
	},
	{
		"GCBallesteros/NotebookNavigator.nvim",
		enabled = true,
		event = "VeryLazy",
		dependencies = {
			"nvim-mini/mini.comment",
			"benlubas/molten-nvim",
			"quarto-dev/quarto-nvim",
		},
		opts = {
			repl_provider = "molten",
			cell_markers = {
				python = "# %%",
				quarto = "```{python}",
				marimo = "@app.cell",
			},
		},
		keys = function()
			local nn = require("notebook-navigator")
			return {
				-- navigation
				{
					"]j",
					function()
						nn.move_cell("d")
						vim.cmd("normal! j") -- Move cursor to the next line
					end,
					desc = "Next cell",
				},
				{
					"[j",
					function()
						nn.move_cell("u")
						nn.move_cell("u")
						vim.cmd("normal! j") -- Move cursor to the next line
					end,
					desc = "Previous cell",
				},
				-- execute cells
				{
					"<leader>jj",
					nn.run_cell,
					desc = "Run cell",
				},
				{
					"<S-Enter>",
					nn.run_cell,
					desc = "Run cell",
				},
				{
					"<C-Enter>",
					function()
						local file_type = vim.bo.filetype
						if file_type == "quarto" then
							vim.cmd("QuartoSend")
							nn.move_cell("d")
							vim.cmd("normal! j") -- Move cursor to the next line
						else -- ju.py etc
							nn.run_and_move()
							vim.cmd("normal! j") -- Move cursor to the next line
						end
					end,
					mode = { "n", "i" },
					desc = "Run cell and move",
				},
				{
					"<leader>jJ",
					nn.run_and_move,
					desc = "Run cell and move",
				},
				{
					"<leader>jA",
					nn.run_all_cells,
					desc = "Run all cells",
				},
				-- edit cells
				-- delete cell : daj
				{
					"<leader>jc",
					nn.comment_cell,
					desc = "Comment cell",
				},
				{
					"<leader>j-",
					nn.split_cell,
					desc = "Split cell",
				},
				{
					"<leader>jM",
					function()
						nn.merge_cell("u")
					end,
					desc = "Merge cell with above",
				},
				{
					"<leader>jm",
					function()
						nn.merge_cell("d")
					end,
					desc = "Merge cell with below",
				},
				{
					"<leader>jk",
					function()
						local file_type = vim.bo.filetype
						if file_type == "quarto" then
							nn.add_cell_below()
							-- Insert after the cursor : empty line + end of cell
							vim.api.nvim_put({ "", "```" }, "l", true, false)
						else
							nn.add_cell_below()
							vim.cmd("normal! j") -- Move cursor to the next line
							-- vim.cmd("startinsert") -- enter insert mode
						end
					end,
					desc = "Add cell below",
				},
				{
					"<leader>jK",
					function()
						nn.add_cell_above()
						vim.cmd("normal! k") -- Move cursor to the previous line
						-- vim.cmd("startinsert") -- enter insert mode
					end,
					desc = "Add cell above",
				},
			}
		end,
	},
	{
		-- highlight notebook cells separators
		"nvim-mini/mini.hipatterns",
		event = "VeryLazy",
		dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
		opts = function(_, opts)
			local nn = require("notebook-navigator")
			-- Merge with existing opts
			opts.highlighters = opts.highlighters or {}
			opts.highlighters.cells = nn.minihipatterns_spec
			return opts
		end,
	},
	{
		-- add cell objects to mini.ai : daj = delete around cell etc
		"nvim-mini/mini.ai",
		event = "VeryLazy",
		dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
		opts = function()
			local nn = require("notebook-navigator")
			return { custom_textobjects = { j = nn.miniai_spec } }
		end,
	},
	-- {
	-- 	-- sync ju.py file to ipynb if opened in jupyterlab
	-- 	"SUSTech-data/neopyter",
	-- 	enabled = false,
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter", -- neopyter don't depend on `nvim-treesitter`, but does depend on treesitter parser of python
	-- 		"AbaoFromCUG/websocket.nvim", -- for mode='direct'
	-- 	},
	--
	-- 	---@type neopyter.Option
	-- 	opts = {
	-- 		mode = "direct",
	-- 		remote_address = "127.0.0.1:9001",
	-- 		file_pattern = { "*.ju.*" },
	-- 		on_attach = function(bufnr)
	-- 			-- do some buffer keymap
	-- 		end,
	-- 		highlight = {
	-- 			enable = false,
	-- 		},
	-- 		textobject = {
	-- 			enable = true,
	-- 			queries = {
	-- 				"cellseparator",
	-- 				"cellcontent",
	-- 				"cell",
	-- 			},
	-- 		},
	-- 	},
	-- 	keys = {
	-- 		{ "<C-Enter>", "<cmd>Neopyter execute notebook:run-cell<cr>", desc = "run cell", mode = { "n", "i" } },
	-- 		{
	-- 			"<leader>ja",
	-- 			"<cmd>Neopyter execute notebook:run-all-above<cr>",
	-- 			desc = "run cell and above",
	-- 			mode = "n",
	-- 		},
	-- 		{ "<leader>jb", "<cmd>Neopyter execute notebook:run-all-below<cr>", desc = "run all below", mode = "n" },
	-- 		{
	-- 			"<leader>jA",
	-- 			"<cmd>Neopyter execute notebook:restart-run-all<cr>",
	-- 			desc = "restart and run all cells",
	-- 			mode = "n",
	-- 		},
	-- 		{
	-- 			"<leader>js",
	-- 			"<cmd>Neopyter execute notebook:restart-and-run-to-selected<cr>",
	-- 			desc = "restart and run to selected",
	-- 			mode = "n",
	-- 		},
	-- 		{ "<leader>jr", "<cmd>Neopyter execute kernelmenu:restart<cr>", desc = "restart kernel", mode = "n" },
	-- 		{ "<leader>ji", "<cmd>Neopyter execute kernelmenu:interrupt<cr>", desc = "interrupt kernel", mode = "n" },
	-- 		{
	-- 			"<leader>jS",
	-- 			"<cmd>Neopyter sync current<cr>",
	-- 			desc = "sync notebook",
	-- 			mode = "n",
	-- 		},
	-- 		{
	-- 			"<leader>jj",
	-- 			function()
	-- 				-- Insert a new cell with '# %%' marker
	-- 				vim.api.nvim_put({ "# %%", "" }, "l", true, true)
	-- 				-- Move cursor to the empty line after the cell marker
	-- 				vim.cmd("normal! j")
	-- 				-- Optionally enter insert mode
	-- 				vim.cmd("startinsert")
	-- 			end,
	-- 			desc = "create new cell",
	-- 			mode = "n",
	-- 		},
	-- 		{
	-- 			"<leader>jn",
	-- 			"<cmd>lua create_notebook_from_template()<cr>",
	-- 			desc = "create new notebook",
	-- 			mode = "n",
	-- 		},
	-- 	},
	-- },
	-- {
	-- 	-- add jupyterlab as a source for blink completions
	-- 	"saghen/blink.cmp",
	-- 	opts = {
	-- 		sources = {
	-- 			default = {
	-- 				"neopyter",
	-- 			},
	-- 			providers = {
	-- 				neopyter = {
	-- 					name = "Neopyter",
	-- 					module = "neopyter.blink",
	-- 					score_offset = 100,
	-- 					---@type neopyter.CompleterOption
	-- 					opts = {},
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- },
}
