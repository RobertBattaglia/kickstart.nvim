-- Always center when navigating up and down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Window Navigation
vim.keymap.set('n', '<leader>h', '<cmd>wincmd h<CR>')
vim.keymap.set('n', '<leader>j', '<cmd>wincmd j<CR>')
vim.keymap.set('n', '<leader>k', '<cmd>wincmd k<CR>')
vim.keymap.set('n', '<leader>l', '<cmd>wincmd l<CR>')

-- Last Buffer
vim.keymap.set('n', '<leader><Tab>', '<cmd>b#<CR>', { desc = 'last buffer' })

-- rsync Wrapper Script
vim.keymap.set('n', '<leader>rs', '<cmd>silent !rs l<CR>', { desc = 'rsync wrapper' })

-- Quick Fix List
vim.keymap.set('n', '<leader>cn', '<cmd>cnext<CR>zz', { desc = 'cnext' })
vim.keymap.set('n', '<leader>cp', '<cmd>cprev<CR>zz', { desc = 'cprev' })

-- Location List
vim.keymap.set('n', '<leader>ln', '<cmd>lnext<CR>zz', { desc = 'lnext' })
vim.keymap.set('n', '<leader>lp', '<cmd>lprev<CR>zz', { desc = 'lprev' })

-- Fugitive Keymaps
vim.keymap.set('n', '<leader>gh', '<cmd>0Gclog<CR>', { desc = '[G]it [H]istory of current file in quickfix list' })
