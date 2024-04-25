function Delete_scratch_buffers()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_get_option(buf, 'buftype') == 'nofile'
			and not vim.api.nvim_buf_get_option(buf, 'buflisted') then

			pcall(function() vim.api.nvim_buf_delete(buf, { force = true }) end)
		end
	end
end

vim.api.nvim_create_user_command('Dsb', Delete_scratch_buffers, { })
