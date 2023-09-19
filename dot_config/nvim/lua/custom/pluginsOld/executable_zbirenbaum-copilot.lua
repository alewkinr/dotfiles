-- GitHub Copilot integration in Vim

return {
	-- integration copilot and copilot-csp (adapter to nvim-csp)
	{
		"zbirenbaum/copilot-cmp",
		dependencies = {
			{
				'zbirenbaum/copilot.lua',
				cmd = "Copilot",
				event = "InsertEnter",
				opts = {
					panel = { enabled = false },
					suggestion = { enabled = false },
					filetypes = {
						-- ON filetypes
						markdown = true,
						yaml = true,
						javascript = true,
						typescript = true,
						-- OFF filetypes
						help = false,
						gitcommit = false,
						gitrebase = false,
						hgcommit = false,
						svn = false,
						cvs = false,
						["."] = false,
					},
					copilot_node_command = 'node', -- Node.js version must be > 16.x
					server_opts_overrides = {
						settings = {
							listCount = 10,
							inlineSuggestCount = 5,
						}
					},
				}
			},
		},
		config = function()
			require("copilot_cmp").setup({
				formatters = {
					label = require("copilot_cmp.format").format_label_text,
					insert_text = require("copilot_cmp.format").format_insert_text,
					preview = require("copilot_cmp.format").deindent,
				},
			})
		end
	}
}
