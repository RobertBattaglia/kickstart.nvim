-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	'mfussenegger/nvim-jdtls',
	'tpope/vim-fugitive',
	{
		'navarasu/onedark.nvim',
		priority = 1000,
		config = function()
			require('onedark').setup({
				style = 'deep'
			})
			require('onedark').load()
			vim.cmd.colorscheme 'onedark'
		end,
	},
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup({
				api_key_cmd = "get-openai-api-key",
				keymaps = {
					select_session = "<leader>s",
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim"
		}
	},
	{
		"sourcegraph/sg.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require('sg').setup({})
		end,
	},
	{
		"windwp/nvim-autopairs",
		dependencies = { 'hrsh7th/nvim-cmp' },
		config = function()
			require("nvim-autopairs").setup {}
			-- If you want to automatically add `(` after selecting a function or method
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')
			local cmp = require('cmp')
			cmp.event:on(
				'confirm_done',
				cmp_autopairs.on_confirm_done()
			)
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		config = function()
			require("nvim-ts-autotag").setup()
		end
	},
	{
		 "folke/trouble.nvim",
		 dependencies = { "nvim-tree/nvim-web-devicons" },
		 opts = {
		  -- your configuration comes here
		  -- or leave it empty to use the default settings
		  -- refer to the configuration section below
		 },
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function ()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end

	},
	{
		"zbirenbaum/copilot-cmp",
		config = function ()
			require("copilot_cmp").setup()
		end
	},
	"onsails/lspkind.nvim"
}
