-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	'mfussenegger/nvim-jdtls',
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

		-- If you have a recent version of lazy.nvim, you don't need to add this!
		build = "nvim -l build/init.lua",
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
	}
}
