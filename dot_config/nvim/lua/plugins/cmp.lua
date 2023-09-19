-- https://github.com/hrsh7th/nvim-cmp
local function check_active()
	local buftype = vim.api.nvim_buf_get_option(0, "buftype")
	if buftype == "prompt" then return false end

	return vim.g.cmp_active
end



-- setting highlignting for CopilotItems in Cmp
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
local cmp = require("cmp")
local icons = require("user.icons")

-- func to filter text files
local function only_text_kind(entry, _)
	local kind = cmp.types.CompletionItemKind[entry:get_kind()]
	if kind == cmp.types.CompletionItemKind.Text then return true end
	return false
end

cmp.setup({
	-- check enabled func
	enabled = check_active,
	-- snippets extentions
	snippet = {},
	sources = {
		{ name = 'nvim_lsp', group_index = 1 },               -- add lsp source
		{ name = "copilot",  group_index = 1 },               -- add copilot source
		{ name = 'emoji',    option = { insert = true }, group_index = 2 }, -- add emoji source
		{ name = 'path',     group_index = 2 },               -- add path source
		{ name = 'buffer',   group_index = 2 },               -- add buffer source
	},
	formatting = {
		fields = { "kind", "abbr" },
		format = function(_, vim_item)
			vim_item.kind = icons.kind[vim_item.kind]
			return vim_item
		end
	},
	matching = {
		disallow_fuzzy_matching = true,
		disallow_partial_fuzzy_matching = true,
		disallow_prefix_unmatching = true,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	experimental = { native_menu = true, ghost_text = true }, -- adds ghost_text view
	mapping = {
		["<C-Space>"] = cmp.mapping.complete(),

		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),

		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, {
			'i',
			's',
		}),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),

		["<Esc>"] = cmp.mapping(cmp.mapping.abort(), { "s" }),
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({ { name = "cmdline" } }, { { name = "path" } })
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "cmdline" },
	}, {
		{ name = "path" },
	}),
})
