-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
---@module "lazy"
---@type LazySpec
return {
  {
    'LintaoAmons/scratch.nvim',
    event = 'VeryLazy',
  },
  -- Beautiful messages
  {
    'rcarriga/nvim-notify',
    opts = {
      minimum_width = 25,
      render = 'minimal',
      timeout = 2000,
    },
    config = function()
      vim.notify = require 'notify'
    end,
  },

  -- Additional lua configuration, makes nvim stuff amazing!
  'airblade/vim-rooter',

  {
    'klen/nvim-config-local',
    lazy = false,
    opts = {
      silent = true,
      -- Config file patterns to load (lua supported)
      config_files = {
        '.nvim.lua',
        '.nvimrc',
        '.exrc',
        '.init.lua',
      },
    },
  },

  -- from tpope's vault
  'tpope/vim-rhubarb',
  'tpope/vim-unimpaired',
  'tpope/vim-projectionist',
  'tpope/vim-dispatch',
  'tpope/vim-eunuch',
  'tpope/vim-abolish',

  {
    'tpope/vim-fugitive',
    lazy = false,
    cmd = { 'Git', 'G' },
    keys = { { '<leader>gs', '<cmd>Git<cr>', desc = '[G]it [S]tatus' } },
  },

  {
    'lambdalisue/suda.vim',
    cmd = { 'SudaRead', 'SudaWrite' },
  },

  -- surround
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    main = 'nvim-surround',
    opts = {},
  },

  -- align text
  {
    'junegunn/vim-easy-align',
    keys = {
      { '<leader>E', '<Plug>(LiveEasyAlign)', mode = { 'n', 'v' }, desc = 'Open parent directory' },
    },
  },

  -- persistence undo
  {
    'mbbill/undotree',
    config = function()
      vim.cmd 'let g:undotree_WindowLayout = 2'
    end,
    keys = { { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = 'Toggle UndoTree' } },
  },

  -- tmux naigator
  'christoomey/vim-tmux-navigator',

  -- execute selection in tmux pane
  {
    'jpalardy/vim-slime',
    config = function()
      vim.cmd [[ let g:slime_target = "tmux" ]]
      vim.cmd [[ let g:slime_default_config = {"socket_name": "default", "target_pane": ".2"} ]]
      vim.cmd [[ let g:slime_dont_ask_default = 1 ]]
      vim.cmd [[ let g:slime_bracketed_paste = 1 ]]
    end,
  },

  -- hex colors
  {
    'norcalli/nvim-colorizer.lua',
    event = 'VeryLazy',
    config = function()
      require('colorizer').setup({
        'css',
        'scss',
        'javascript',
        html = { mode = 'background' },
      }, { mode = 'foreground' })
    end,
  },

  {
    'SmiteshP/nvim-navbuddy',
    cmd = 'SymbolsOutline',
    dependencies = {
      'SmiteshP/nvim-navic',
      'MunifTanjim/nui.nvim',
    },
    opts = { lsp = { auto_attach = true }, window = { size = '99%' } },
    keys = { { '<leader>nb', '<cmd>Navbuddy<cr>', desc = 'Nav buddy' } },
  },
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    event = 'BufRead',
    opts = {
      disable_diagnostics = true,
      highlights = { incoming = 'DiffChange', current = 'DiffAdd' },
    },
  },
  -- doc gen
  {
    'kkoomen/vim-doge',
    build = ':call doge#install()',
    config = function()
      vim.cmd [[let g:doge_mapping='<Leader>dc']]
    end,
  },

  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    main = 'ts_context_commentstring',
    opts = {},
  },

  -- swap places of siblings
  {
    'Wansmer/sibling-swap.nvim',
    dependencies = { 'nvim-treesitter' },
    opts = {},
  },

  -- Extend vim %
  {
    'andymass/vim-matchup',
    event = 'BufReadPost',
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = 'status_manual' }
    end,
  },
  -- FML
  {
    'eandrju/cellular-automaton.nvim',
    cmd = 'CellularAutomaton',
    keys = {
      { '<leader>fml', '<cmd>CellularAutomaton make_it_rain<CR>', desc = 'Desc' },
    },
  },

  --handling CSV data with Vim
  {
    'chrisbra/csv.vim',
    lazy = false,
  },

  {
    'ray-x/lsp_signature.nvim',
    enabled = false,
    event = 'VeryLazy',
    opts = {
      hint_prefix = '➤ ',
      bind = true,
      handler_opts = {
        border = 'rounded',
      },
    },
  },
  {
    -- <c-a> and <c-x> for numbers
    'smjonas/live-command.nvim', -- live command
    config = function()
      require('live-command').setup { commands = { Norm = { cmd = 'norm' } } }
    end,
  },
}
