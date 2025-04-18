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
      require('onedark').setup {
        style = 'deep',
      }
      require('onedark').load()
      vim.cmd.colorscheme 'onedark'
    end,
  },
  {
    'sourcegraph/sg.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('sg').setup {
        enable_cody  = false, -- 😭
        chat = {
          default_model = 'anthropic/claude-3-5-sonnet',
        },
      }
    end,
  },
  {
    'windwp/nvim-autopairs',
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
        copilot_node_command = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v20.19.0/bin/node",
      }
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    config = function()
      require('copilot_cmp').setup()
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
      model = 'claude-3.5-sonnet',
      mappings = {
        show_help = {
          normal = 'g?',
        },
      }

    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  'onsails/lspkind.nvim',
  {
    'Isrothy/neominimap.nvim',
    enabled = true,
    lazy = false, -- NOTE: NO NEED to Lazy load
    -- Optional
    keys = {
      { '<leader>nt', '<cmd>Neominimap toggle<cr>', desc = 'Toggle minimap' },
      { '<leader>no', '<cmd>Neominimap on<cr>', desc = 'Enable minimap' },
      { '<leader>nc', '<cmd>Neominimap off<cr>', desc = 'Disable minimap' },
      { '<leader>nf', '<cmd>Neominimap focus<cr>', desc = 'Focus on minimap' },
      { '<leader>nu', '<cmd>Neominimap unfocus<cr>', desc = 'Unfocus minimap' },
      { '<leader>ns', '<cmd>Neominimap toggleFocus<cr>', desc = 'Toggle focus on minimap' },
      { '<leader>nwt', '<cmd>Neominimap winToggle<cr>', desc = 'Toggle minimap for current window' },
      { '<leader>nwr', '<cmd>Neominimap winRefresh<cr>', desc = 'Refresh minimap for current window' },
      { '<leader>nwo', '<cmd>Neominimap winOn<cr>', desc = 'Enable minimap for current window' },
      { '<leader>nwc', '<cmd>Neominimap winOff<cr>', desc = 'Disable minimap for current window' },
      { '<leader>nbt', '<cmd>Neominimap bufToggle<cr>', desc = 'Toggle minimap for current buffer' },
      { '<leader>nbr', '<cmd>Neominimap bufRefresh<cr>', desc = 'Refresh minimap for current buffer' },
      { '<leader>nbo', '<cmd>Neominimap bufOn<cr>', desc = 'Enable minimap for current buffer' },
      { '<leader>nbc', '<cmd>Neominimap bufOff<cr>', desc = 'Disable minimap for current buffer' },
    },
    init = function()
      vim.opt.wrap = false
      vim.opt.sidescrolloff = 36
      vim.g.neominimap = {
        auto_enable = false,
      }
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},

  },
}
