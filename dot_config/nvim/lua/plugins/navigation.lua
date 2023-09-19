-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- open nvim-tree when vim starts callback
local function open_nvim_tree(data)
	-- buffer is a [No Name]
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not no_name and not directory then
		return
	end
	-- change to the directory
	if directory then
		vim.cmd.cd(data.file)
	end
	-- open the tree
	require("nvim-tree.api").tree.open({ focus = false, find_file = true })
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- close nvim-tree when the last window is closed callback
vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
	pattern = "NvimTree_*",
	callback = function()
		local layout = vim.api.nvim_call_function("winlayout", {})
		if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then
			vim.cmd("confirm quit")
		end
	end
})


-- collapse all files in directory action callback
local function collapse_all()
	require("nvim-tree.actions.tree-modifiers.collapse-all").fn()
end

-- vsplit preview file action callback
local function vsplit_preview()
	local lib = require('nvim-tree.lib')
	local view = require('nvim-tree.view')

	-- open as vsplit on current node
	local action = "vsplit"
	local node = lib.get_node_at_cursor()

	-- Just copy what's done normally with vsplit
	if node.link_to and not node.nodes then
		require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
	elseif node.nodes ~= nil then
		lib.expand_or_collapse(node)
	else
		require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
	end

	-- Finally refocus on tree if it was lost
	view.focus()
end

-- open file under cursor in a new tab
local function open_in_new_tab()
	local lib = require('nvim-tree.lib')
	local api = require('nvim-tree.api')

	local node = lib.get_node_at_cursor()
	if node == nil then return end

	if not node.nodes then
		api.node.open.tab(node)
		api.tree.toggle({ focus = false, find_file = true, update_root = true })
		vim.cmd.tabprev()
	elseif node.nodes ~= nil then
		lib.expand_or_collapse(node)
	end
end

local function edit_or_open()
	local lib = require('nvim-tree.lib')
	local view = require('nvim-tree.view')

	-- open as vsplit on current node
	local action = "edit"
	local node = lib.get_node_at_cursor()

	-- Just copy what's done normally with vsplit
	if node.link_to and not node.nodes then
		require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
		view.close() -- Close the tree if file was opened
	elseif node.nodes ~= nil then
		lib.expand_or_collapse(node)
	else
		require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
		view.close() -- Close the tree if file was opened
	end
end

require("nvim-tree").setup({
	sort_by = "name",
	prefer_startup_root = true,
	renderer = {
		group_empty = true,
		highlight_git = true,
	},
	view = {
		mappings = {
			custom_only = false,
			-- deprecated
			list = {
				{ key = "<Right>",   action = "edit",            action_cb = edit_or_open },
				{ key = "<S-Right>", action_cb = open_in_new_tab },
				{ key = "<Left>",    action = "close_node" },
				{ key = "<S-Left>",  action = "collapse_all",    action_cb = collapse_all }

			},
		}
	},
	filters = {
		dotfiles = false,
		custom = { "^.*(\\.git|\\.idea|\\.DS_Store)$" }
	},
	actions = {
		use_system_clipboard = true,
		open_file = {
			quit_on_open = false,
		},
		change_dir = {
			enable = true,
		}
	},
})
