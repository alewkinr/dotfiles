local marksman = require("custom.lsp.markdown")
local lua_ls = require("custom.lsp.lua_ls")


-- Settings for nvim-lspconfig plugin
return {}
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       -- Automatically install LSPs to stdpath for neovim
--       'williamboman/mason.nvim',
--       'williamboman/mason-lspconfig.nvim',
--
--       -- Useful status updates for LSP
--       -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
--       { 'j-hui/fidget.nvim', opts = {} },
--
--       -- Additional lua configuration, makes nvim stuff amazing!
--       'folke/neodev.nvim',
--     },
--
--     opts = {
-- --       servers = {
-- --         marksman = marksman,
-- --         lua_ls = lua_ls,
-- --       },
--     },
--   }
--
--
