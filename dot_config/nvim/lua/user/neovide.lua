-- TODO: remove this file
-- [[ Neovide Settings ]]
if vim.g.neovide then
	-- font settings
	vim.o.guifont = "JetBrainsMono Nerd Font:h13"
	-- scroll animation settings
	vim.g.neovide_scroll_animation_length = 0.2
	-- mouse settings
	vim.g.neovide_hide_mouse_when_typing = true
	-- quit settings
	vim.g.neovide_confirm_quit = true
	-- window settings
	vim.g.neovide_remember_window_size = true
	-- keyboard settings
	vim.g.neovide_input_macos_alt_is_meta = true
	vim.g.neovide_input_use_logo = true -- turns on SUPER keymap
	-- cursor settings
	vim.g.neovide_cursor_animate_in_insert_mode = false
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.neovide_cursor_vfx_mode = ""
	vim.g.neovide_cursor_animation_length = 0.05

	-- Keybindings for scaling neovide
	vim.g.neovide_scale_factor = 1.0
	local change_scale_factor = function(delta) vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta end
	local set_default_scale_factor = function() vim.g.neovide_scale_factor = 1.0 end

	vim.keymap.set("n", "<D-=>", function() change_scale_factor(1.25) end)
	vim.keymap.set("n", "<D-->", function() change_scale_factor(1 / 1.25) end)
	vim.keymap.set("n", "<D-0>", function() set_default_scale_factor() end)
end
