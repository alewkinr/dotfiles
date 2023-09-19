-- Reload NeoVim config
function _G.ReloadConfig()
	for name, _ in pairs(package.loaded) do
		if name:match("^user") then
			package.loaded[name] = nil
		end
	end
	local vimConfig = "~/.config/nvim/init.lua"
	-- dofile(vim.env.MYVIMRC)
	dofile(vimConfig)
end

vim.api.nvim_create_user_command("ReloadConfig", ReloadConfig, { desc = "reload lua.user.*.lua" })
