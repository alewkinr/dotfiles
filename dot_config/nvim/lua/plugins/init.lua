-- start to use packer as a package manager for NeoVim
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- System
	use("wbthomason/packer.nvim")

	-- Code
	use("neovim/nvim-lspconfig") -- helps to easy LSP configure
	use("zbirenbaum/copilot.lua")
	use({ "zbirenbaum/copilot-cmp" })
	use("hrsh7th/cmp-nvim-lsp")                            -- supports LSP sources
	use("hrsh7th/cmp-cmdline")                             -- supports neovim-cmd source
	use("hrsh7th/cmp-buffer")                              -- supports buffer source
	use("hrsh7th/cmp-path")                                -- supports paths source
	use("hrsh7th/cmp-emoji")                               -- supports emoji source
	use("hrsh7th/nvim-cmp")                                -- supports code completions from sources
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- syntax highlight
	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- Base
	use("akinsho/toggleterm.nvim")

	-- View
	use({ "projekt0n/github-nvim-theme", tag = "v0.0.7" })
	use("nvim-lualine/lualine.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use({ "arkav/lualine-lsp-progress", requires = "nvim-lualine/lualine.nvim" })
	use("nvim-tree/nvim-web-devicons")
	use("rcarriga/nvim-notify")
	use({ "j-hui/fidget.nvim" })
	use("folke/neodev.nvim")

	-- Navigation
	use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } })
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

	-- Edit
	use("numToStr/Comment.nvim")


	--	 use("L3MON4D3/LuaSnip")
	--	 use("saadparwaiz1/cmp_luasnip")
	--	 use("rafamadriz/friendly-snippets")
	--	 use("ray-x/lsp_signature.nvim")
	--	 use("chr4/nginx.vim")
	--	 use("MunifTanjim/prettier.nvim")
	--	 use("jose-elias-alvarez/null-ls.nvim")

	--	 use("mfussenegger/nvim-dap")
	--	 use("leoluz/nvim-dap-go")
	--	 use("rcarriga/nvim-dap-ui")
	--	 use("nvim-neotest/neotest")
	--	 use("nvim-neotest/neotest-go")

	-- Base
	--	 use("folke/todo-comments.nvim")
	--	 use("antoinemadec/FixCursorHold.nvim")
	--	 use("folke/which-key.nvim")

	-- View

	-- Navigation
	--	 use("nvim-lua/plenary.nvim")
	--	 use("nvim-telescope/telescope.nvim")
	--	 use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	--	 use("karb94/neoscroll.nvim")
	--	 use("preservim/tagbar")
	--	 use("phaazon/hop.nvim")

	-- Git
	--	 use("lewis6991/gitsigns.nvim")

	-- Edit
	-- use("tpope/vim-surround")
	--	 use("windwp/nvim-autopairs")
end)
