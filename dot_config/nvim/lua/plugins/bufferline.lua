-- https://github.com/akinsho/bufferline.nvim
local _, bufline = pcall(require, "bufferline")

vim.o.showtabline = 1

bufline.setup(
	{
		options = {
			mode = "tabs",
			themable = true,
			numbers = "none",
			tab_size = 18,
			diagnostics = "nvim_lsp",
			show_tab_indicators = true,
			separator_style = "thin",
			always_show_bufferline = true,
			offsets = {
				{
					filetype = "NvimTree",
					text = "~",
					text_align = "center",
					separator = true,
				}
			},
		},
	})
