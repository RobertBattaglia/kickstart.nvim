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
			require('sg').setup({
				chat = {
					default_model = "anthropic/claude-3-5-sonnet",
				}
			})
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
	"onsails/lspkind.nvim",
	{
	    "Isrothy/neominimap.nvim",
	    enabled = true,
	    lazy = false, -- NOTE: NO NEED to Lazy load
	    -- Optional
	    keys = {
		{ "<leader>nt", "<cmd>Neominimap toggle<cr>", desc = "Toggle minimap" },
		{ "<leader>no", "<cmd>Neominimap on<cr>", desc = "Enable minimap" },
		{ "<leader>nc", "<cmd>Neominimap off<cr>", desc = "Disable minimap" },
		{ "<leader>nf", "<cmd>Neominimap focus<cr>", desc = "Focus on minimap" },
		{ "<leader>nu", "<cmd>Neominimap unfocus<cr>", desc = "Unfocus minimap" },
		{ "<leader>ns", "<cmd>Neominimap toggleFocus<cr>", desc = "Toggle focus on minimap" },
		{ "<leader>nwt", "<cmd>Neominimap winToggle<cr>", desc = "Toggle minimap for current window" },
		{ "<leader>nwr", "<cmd>Neominimap winRefresh<cr>", desc = "Refresh minimap for current window" },
		{ "<leader>nwo", "<cmd>Neominimap winOn<cr>", desc = "Enable minimap for current window" },
		{ "<leader>nwc", "<cmd>Neominimap winOff<cr>", desc = "Disable minimap for current window" },
		{ "<leader>nbt", "<cmd>Neominimap bufToggle<cr>", desc = "Toggle minimap for current buffer" },
		{ "<leader>nbr", "<cmd>Neominimap bufRefresh<cr>", desc = "Refresh minimap for current buffer" },
		{ "<leader>nbo", "<cmd>Neominimap bufOn<cr>", desc = "Enable minimap for current buffer" },
		{ "<leader>nbc", "<cmd>Neominimap bufOff<cr>", desc = "Disable minimap for current buffer" },
	    },
	    init = function()
		vim.opt.wrap = false
		vim.opt.sidescrolloff = 36
		vim.g.neominimap = {
		    auto_enable = true,
		}
	    end,
	}
}
