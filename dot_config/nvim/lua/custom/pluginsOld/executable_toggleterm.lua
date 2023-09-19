-- Terminal integration in Vim
return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = true,
		opts = {
			open_mapping = [[<D-2>]],
			start_in_insert = true,
			terminal_mappings = true,
			shade_terminals = false,
			direction = 'horizontal',
		}
	},
}
