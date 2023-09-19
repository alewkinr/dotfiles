-- [[ KEYMAPS ]]
local default_opts = { noremap = true, silent = true }

-- [[TERMINAL KEYMAPS]]
-- General keybindings for terminal mode, helps you to exit terminal faseter
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
  -- experimental keybindings
  vim.keymap.set('t', '<D-k>', [[clear<cr>]], opts) -- clears terminal on CMD + K
end

-- Add this keybindings to your config.lua
--if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


-- [[NVIM TREE KEYMAPS]]
local tree_keymap = {
  toggle_tree = '<D-1>',
}
vim.keymap.set('n', tree_keymap.toggle_tree, ':NvimTreeToggle<CR>', default_opts)



-- [[ TABBY KEYMAPS ]]
local tabs_keymap = {
  add_tab = '<D-t>',
  remove_tab = '<D-w>',
  next_tab = '<M-Tab>',
}
vim.api.nvim_set_keymap("n", tabs_keymap.add_tab, ":$tabnew<CR>", default_opts)
vim.api.nvim_set_keymap("n", tabs_keymap.remove_tab, ":tabclose<CR>", default_opts)
vim.api.nvim_set_keymap("n", tabs_keymap.next_tab, ":tabn<CR>", default_opts)
-- vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true }) -- close all tabs
-- vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true }) -- previous tab

-- [[ COPY AND PASTE KEYMAPS ]]
-- Allow clipboard copy paste in neovim
local clipboard_keymap = {
  save = '<D-s>',
  copy = '<D-c>',
  paste_normal = '<D-v>',
  paste_visual = '<D-v>',
  paste_command = '<D-v>',
  paste_insert = '<D-v>',
}
vim.keymap.set('n', clipboard_keymap.save, ':w<CR>')              -- Save
vim.keymap.set('v', clipboard_keymap.copy, '"+y')                 -- Copy
vim.keymap.set('n', clipboard_keymap.paste_normal, '"+p')         -- Paste normal mode
vim.keymap.set('v', clipboard_keymap.paste_visual, '"+p')         -- Paste visual mode
vim.keymap.set('c', clipboard_keymap.paste_command, '<C-R>+')     -- Paste command mode
vim.keymap.set('i', clipboard_keymap.paste_insert, '<ESC>l"+Pli') -- Paste insert mode



-- [[ COMMENT KEYMAPS ]]
-- Allow commenting in neovim
-- The keybindings settings in mini.comments setup
local comment_keymap = {
  default = 'gc',
  current_line = '<D-/>',
  block = '<D-S-/>',
}

-- [[ PROJECTS KEYMAPS ]]
-- Allows you to switch between projects in neovim
local project_keymap = {
  open_list = '<D-S-p>',
}
vim.keymap.set("n", project_keymap.open_list, function() vim.cmd("Telescope projections") end)

-- [[ TELESCOPE KEYMAPS ]]
-- Allow telescope keybindings
local telescope_keymap = {
  find_files = '<D-c>',
--   live_grep = '<D-S-F>',
}
vim.keymap.set('n', telescope_keymap.find_files, '[[<CMD>Telescope find_files<CR>]]', default_opts)
-- vim.keymap.set('n', telescope_keymap.live_grep, '[[<CMD>Telescope live_grep<CR>]]', default_opts)
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})



return {
  projects = project_keymap,
  comments = comment_keymap,
  tree = tree_keymap,
  tabs = tabs_keymap,
  clipboard = clipboard_keymap,
  telescope = telescope_keymap,
}
