-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- current Color Scheme 
return {
		blue   = '#80a0ff',
		cyan   = '#79dac8',
		black  = '#080808',
		white  = '#c6c6c6',
		red    = '#ff5189',
		violet = '#d183e8',
		grey   = '#303030',
}
