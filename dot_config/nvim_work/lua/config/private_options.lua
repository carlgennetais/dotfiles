-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.spelllang = "en,fr"
vim.filetype.add({

	extension = {
		-- ["ju.py"] = "python",
		-- [".ju.py"] = "python",
		ibis = "python",
		zsh = "sh",
		sh = "sh", -- force sh-files with zsh-shebang to still get sh as filetype
	},

	filename = {
		[".zshrc"] = "sh",
		[".zshenv"] = "sh",
	},
})

local lazyOpts = {
	rocks = { hererocks = false },
}

return lazyOpts
