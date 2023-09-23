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
	}
}
