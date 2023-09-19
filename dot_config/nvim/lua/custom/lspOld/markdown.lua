-- Markdown LSP options for nvim-lsp
return {
	Markdown = {
		filetypes = { "markdown" },
		cmd = { "marksman", "server" },
		single_file_support = true,
	},
}
