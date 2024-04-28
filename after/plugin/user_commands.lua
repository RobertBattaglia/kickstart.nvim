function Delete_scratch_buffers()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_get_option(buf, 'buftype') == 'nofile'
			and not vim.api.nvim_buf_get_option(buf, 'buflisted') then

			pcall(function() vim.api.nvim_buf_delete(buf, { force = true }) end)
		end
	end
end

vim.api.nvim_create_user_command('Dsb', Delete_scratch_buffers, { })

function Git_commit_history_oneline()
	local current_working_dir = vim.fn.getcwd()
	local buffer_file = vim.api.nvim_buf_get_name(0)
	local relative_file = string.sub(buffer_file,
		string.len(current_working_dir) - string.len(buffer_file) + 1)
	local current_line = vim.api.nvim_win_get_cursor(0)[1]

	local fugitive_cmd = string.format('Gclog -L %s,%s:%s', current_line, current_line, relative_file)
	vim.cmd(fugitive_cmd)
end

vim.api.nvim_create_user_command('GitCommitHistoryOneline', Git_commit_history_oneline, { })
