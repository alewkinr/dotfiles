-- [[ LUALINE CONFIG ]]
-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.
-- stylua: ignore

local icons = require('custom.user.icons')
local colors = require('custom.user.colors')

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },
  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },
  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

-- Set lualine as statusline
return {
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = true,
      theme = bubbles_theme,
      component_separators = '|',
      section_separators = { left = '', right = '' },
      ignore_focus = {},    -- turn off lualine for unfocused files
      gloabalstatus = true, -- enable global statusline (have a single statusline at bottom of neovim instead of one for  every window)
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      }
    },
    sections = {
      lualine_a = {
        { 'mode', separator = { left = '' }, right_padding = 2 },
      },
      lualine_b = { 'branch' },
      lualine_c = { 'fileformat' },
      lualine_x = {},
      lualine_y = {
        'filetype',
        {
          'filename',
          path = 0,
          symbols = {
            modified = icons.ui.Pencil,
            readonly = icons.ui.Lock,
            unnamed = icons.ui.Info,
            newfile = icons.ui.Plus,
          }
        },
        'progress',
      },
      lualine_z = {
        { 'location', separator = { right = '' }, left_padding = 2 },
      },
    },
    extensions = { 'nvim-tree', 'toggleterm' },
  }
}
