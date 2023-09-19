-- Changes the cursor shape when entering insert mode from BLOCK to CARET style
-- ref: https://alpha2phi.medium.com/modern-neovim-configuration-hacks-93b13283969f
vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    vim.cmd [[set guicursor=a:ver25]]
  end,
})
