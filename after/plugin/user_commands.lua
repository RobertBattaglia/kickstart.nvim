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

--
-- Custom keybinds for file operations
-- Open current buffer in Google Chrome
vim.api.nvim_create_user_command('OpenInChrome', function()
  local filepath = vim.fn.expand '%:p'
  if filepath == '' then
    vim.notify('No file in current buffer', vim.log.levels.WARN)
    return
  end
  local cmd = string.format('open -a "Google Chrome" "%s"', filepath)
  vim.fn.system(cmd)
  vim.notify('Opened in Chrome: ' .. filepath, vim.log.levels.INFO)
end, { desc = 'Open current buffer in Google Chrome' })

vim.keymap.set('n', '<leader>oc', ':OpenInChrome<CR>', { desc = '[O]pen in [C]hrome', silent = true })

-- Copy current buffer filepath to clipboard
vim.api.nvim_create_user_command('CopyFilePath', function()
  local filepath = vim.fn.expand '%:p'
  if filepath == '' then
    vim.notify('No file in current buffer', vim.log.levels.WARN)
    return
  end
  vim.fn.setreg('+', filepath)
  vim.notify('Copied to clipboard: ' .. filepath, vim.log.levels.INFO)
end, { desc = 'Copy current buffer file path to clipboard' })

vim.keymap.set('n', '<leader>cp', ':CopyFilePath<CR>', { desc = '[C]opy file [P]ath', silent = true })

