-- https://github.com/projekt0n/github-nvim-theme
require("github-theme").setup({
	theme_style = "dark_default",
	hide_inactive_statusline = false,

	-- Overwrite the highlight groups
	overrides = function(c)
		return {
			StatusLine = { fg = c.bg, bg = c.bg },
		}
	end
})

