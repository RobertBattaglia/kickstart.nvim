-- Always center when navigating up and down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Last Buffer
vim.keymap.set('n', '<leader><Tab>', '<cmd>b#<CR>', { desc = 'last buffer' })

-- rsync Wrapper Script
vim.keymap.set('n', '<leader>rsc', '<cmd>silent !rsc l<CR>', { desc = 'rsync wrapper' })

-- Quick Fix List
vim.keymap.set('n', '<leader>cn', '<cmd>cnext<CR>zz', { desc = 'cnext' })
vim.keymap.set('n', '<leader>cp', '<cmd>cprev<CR>zz', { desc = 'cprev' })

-- Location List
vim.keymap.set('n', '<leader>ln', '<cmd>lnext<CR>zz', { desc = 'lnext' })
vim.keymap.set('n', '<leader>lp', '<cmd>lprev<CR>zz', { desc = 'lprev' })

-- diagnostics
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = '[D]iagnostics [N]ext' })
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = '[D]iagnostics [P]rev' })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = 'Diagnostics [E]xplore' })


-- Fugitive Keymaps
vim.keymap.set('n', '<leader>gh', '<cmd>0Gclog!<CR>', { desc = '[G]it [H]istory of current file in quickfix list' })
vim.keymap.set('n', '<leader>gl', '<cmd>GitCommitHistoryOneline<CR>', { desc = '[G]it History of current [L]ine in quickfix list' })

-- Sourcegraph
vim.keymap.set('n', '<leader>ss', '<cmd>SourcegraphSearch<CR>', { desc = '[S]ourcegraph [S]earch' })
vim.keymap.set('n', '<leader>sl', '<cmd>SourcegraphLink<CR>', { desc = '[S]ourcegraph [L]ink' })

-- CopilotChat
vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChatToggle<CR>', { desc = '[C]opilot [C]hat' })
vim.keymap.set('n', '<leader>cr', '<cmd>CopilotChatReset<CR>', { desc = '[C]opilot Chat [R]eset' })

-- Neotree
vim.keymap.set('n', '<leader>,', '<cmd>Neotree toggle reveal<CR>', { desc = 'Neotree toggle reveal' })
