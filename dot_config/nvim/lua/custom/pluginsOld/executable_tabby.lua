-- Tabs integration in Vim
vim.o.showtabline = 2
local icons = require('custom.user.icons')

-- tab_name returns tab name or nil
local function get_tab_name(tab)
	return tab.number()
end

-- tab label render function
local function get_tab_label(name, active)
	local icon = active and icons.ui.ActiveTab or icons.ui.InactiveTab
	return string.format('%s %s ', icon, name)
end
-- TABS
-- render active tab
local function get_active_tab(line, tab, tab_name, theme)
	return {
		line.sep(' ', theme.fill, theme.fill),
		get_tab_label(tab_name, true),
		tab.close_btn(icons.ui.Close),
		line.sep(' ', theme.fill, theme.fill),
		hl = { fg = theme.normal.fg, bg = theme.fill.bg, style = 'bold' },
	}
end
-- render inactive tab
local function get_inactive_tab(line, tab, tab_name, theme)
	return {
		line.sep(' ', theme.normal, theme.normal),
		get_tab_label(tab_name, false),
		tab.close_btn(icons.ui.Close),
		line.sep(' ', theme.normal, theme.normal),
		hl = { fg = theme.normal.fg, bg = theme.normal.bg },
	}
end

-- WINS
-- win name getter
local function get_win_name(text, icon)
	local file_icon = ""
	if icon ~= nil then file_icon = icon end
	return string.format('%s  %s', file_icon, text)
end
-- substitute win name with short icon if needed
local function substitute_service_win_name(name)
	local black_list = {
		NvimTree = icons.documents.Folder,
		term = icons.misc.Terminal,
	}

	for key, val in pairs(black_list) do
		if string.match(name, key) then return string.format(" %s ", val), true end
	end
	return name, false
end

-- render active win
local function get_active_win(line, name, theme)
	return {
		line.sep(string.format('%s', icons.ui.TabSeparatorLeft), theme.selected, theme.fill),
		name,
		line.sep(string.format('%s', icons.ui.TabSeparatorRight), theme.selected, theme.fill),
		hl = { fg = theme.selected.fg, bg = theme.selected.bg, style = 'bold' },
	}
end

-- render inactive win
local function get_inactive_win(line, name, theme)
	return {
		line.sep(" ", theme.normal, theme.fill),
		name,
		line.sep(" ", theme.normal, theme.fill),
		hl = { fg = theme.normal.fg, bg = theme.fill.bg, style = 'bold' },
	}
end

-- function to render ordered wins
local function render_ordered_wins(line, theme)
	local primary_wins = {}
	local wins = {}
	line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
		local name = win.buf_name()
		local is_current = win.is_current()
		local is_substituted = false

		if line.api.is_float_win(win.id) then name = '[Floating]' end
		name, is_substituted = substitute_service_win_name(name)
		if not is_substituted then name = get_win_name(name, win.file_icon()) end

		if is_current and is_substituted then
			table.insert(primary_wins, get_active_win(line, name, theme))
		elseif not is_current and is_substituted then
			table.insert(primary_wins, get_inactive_win(line, name, theme))
		elseif is_current then
			table.insert(wins, get_active_win(line, name, theme))
		else
			table.insert(wins, get_inactive_win(line, name, theme))
		end
	end)

	for _,v in ipairs(wins) do table.insert(primary_wins, v) end
	return primary_wins
end

return {
	{
		'nanozuki/tabby.nvim',
		version = "*",
		dependencies = {
			'nvim-lualine/lualine.nvim'
		},
		config = function()
			require('tabby.tabline').set(function(line)
				local hi_util = require('tabby.module.highlight')
				local theme = {
					normal = hi_util.extract('lualine_b_normal'),
					fill = hi_util.extract('lualine_c_normal'),
					selected = hi_util.extract('lualine_a_normal'),
				}


				return {
					-- head
					{ { string.format(' %s ', icons.misc.SuperButton), hl = 'Normal' } },

					-- tabs
					line.tabs().foreach(function(tab)
						local name = get_tab_name(tab)
						if not name then return {} end

						if tab.is_current() then
							return get_active_tab(line, tab, name, theme)
						else
							return get_inactive_tab(line, tab, name, theme)
						end
					end),

					-- wins
					render_ordered_wins(line, theme)
				}
			end, {
				buf_name = {
					mode = "relative",
				}
			})
		end
	}
}
