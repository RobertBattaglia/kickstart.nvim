return {
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('telescope').setup({
				pickers = {
					find_files = {
						find_command = { 'rg', '--files', '--hidden', '-g', '!.git' }
					},
					buffers = {
						mappings = {
							i = {
								["<c-d>"] = "delete_buffer"
							}
						}
					}
				}

			})
		end
	},
}
