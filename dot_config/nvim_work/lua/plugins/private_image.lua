return {
	{
		-- necessary for image.nvim
		"vhyrro/luarocks.nvim",
		enabled = false,
		priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
		config = true,
	},
	{
		-- TODO: replace with "folke/snacks.nvim" when molten will support it
		"3rd/image.nvim",
		enabled = false,
		dependencies = {
			"leafo/magick", -- that's a lua rock
		},
		opts = {
			backend = "kitty",
			kitty_method = "normal",
			-- processor = "magick_rock", -- or "magick_cli"
			integrations = {
				markdown = {
					enabled = true,
					download_remote_images = true,
					only_render_image_at_cursor = true,
					clear_in_insert_mode = false,
					floating_windows = false, -- if true, images will be rendered in floating markdown windows
					filetypes = { "markdown", "vimwiki", "quarto" }, -- markdown extensions (ie. quarto) can go here
				},
				html = {
					enabled = false,
				},
				css = {
					enabled = false,
				},
			},
			max_width = 100,
			max_height = 20,
			max_width_window_percentage = math.huge,
			max_height_window_percentage = math.huge,
			window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
			window_overlap_clear_ft_ignore = {
				"",
				"cmp_menu",
				"cmp_docs",
				"snacks_notif",
				"snacks_picker",
				"snacks_explorer",
				"snacks",
				"scrollview",
				"scrollview_sign",
			},
			editor_only_render_when_focused = true, -- auto show/hide images when the editor gains/looses focus
			tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
			hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
		},
	},
}
