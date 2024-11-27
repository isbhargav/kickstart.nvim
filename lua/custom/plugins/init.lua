-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
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
  'folke/neodev.nvim',
  'airblade/vim-rooter',
  -- {
  --   'notjedi/nvim-rooter.lua',
  --   -- NOTE: avoid lazy loading as the autocmds may not be caught by nvim-rooter.lua.
  --   lazy = false,
  --   opts = {
  --     manual = false,
  --   },
  -- },
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

  'tpope/vim-rhubarb',
  -- from tpope's vault
  { 'tpope/vim-unimpaired', event = 'VeryLazy' },
  'tpope/vim-projectionist',
  'tpope/vim-dispatch',
  'tpope/vim-eunuch',
  'tpope/vim-abolish',

  {
    'tpope/vim-fugitive',
    lazy = false,
    -- cmd = { 'Git', 'G' },
    keys = { { '<leader>gs', '<cmd>Git<cr>', desc = '[G]it [S]tatus' } },
  },

  'rhysd/git-messenger.vim',

  {
    'junegunn/gv.vim',
    dependencies = { 'tpope/vim-fugitive' },
    cmd = { 'GV' },
    keys = {
      { '<leader>gv', '<cmd>GV<cr>', mode = 'n', desc = '[G]it [V]ertical Graph' },
      { '<leader>gv', "<cmd>'<,'>GV<cr>", mode = 'v', desc = '[G]it [V]ertical Graph' },
    },
  },
  {
    'rbong/vim-flog',
    lazy = true,
    cmd = { 'Flog', 'Flogsplit', 'Floggit' },
    dependencies = {
      'tpope/vim-fugitive',
    },
  },

  {
    'stevearc/oil.nvim',
    keys = {
      { '-', '<CMD>Oil<CR>', mode = 'n', desc = 'Open parent directory' },
    },
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      columns = {
        'icon',
        'permissions',
        'size',
        'mtime',
      },
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        ['<C-s>'] = 'actions.select_vsplit',
        ['<C-h>'] = false,
        ['<C-t>'] = 'actions.select_tab',
        ['<C-p>'] = 'actions.preview',
        ['<C-c>'] = 'actions.close',
        ['<C-l>'] = false,
        ['-'] = 'actions.parent',
        ['_'] = 'actions.open_cwd',
        ['`'] = 'actions.cd',
        ['~'] = 'actions.tcd',
        ['gs'] = 'actions.change_sort',
        ['gx'] = 'actions.open_external',
        ['g.'] = 'actions.toggle_hidden',
        ['g\\'] = 'actions.toggle_trash',
      },
    },
    -- Optional dependencies
    dependencies = {
      -- 'nvim-tree/nvim-web-devicons',
      'echasnovski/mini.icons',
      opts = {},
    },
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

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
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
  -- OSCYank
  {
    'ojroques/nvim-osc52',
    branch = 'main',
    config = function()
      require('osc52').setup {
        max_length = 0, -- Maximum length of selection (0 for no limit)
        silent = false, -- Disable message on successful copy
        trim = false, -- Trim surrounding whitespaces before copy
        tmux_passthrough = false, -- Use tmux passthrough (requires tmux: set -g allow-passthrough on)
      }

      vim.g.oscyank_term = 'default' -- or 'screen', 'kitty', 'tmux'

      vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, { expr = true })
      vim.keymap.set('n', '<leader>cc', '<leader>c_', { remap = true })
      vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)
    end,
  },

  -- harpoon files
  {
    'ThePrimeagen/harpoon',
    dependencies = 'nvim-lua/plenary.nvim',
    branch = 'harpoon2',
    lazy = false,
    config = function()
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup {
        settings = {
          save_on_toggle = true,
        },
      }
      -- REQUIRED

      vim.keymap.set('n', '<C-p>', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<leader>p', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
    end,
  },

  -- diffview
  {
    'sindrets/diffview.nvim',
    -- event="VeryLazy",
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {},
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

  -- split/join lines
  {
    'Wansmer/treesj',
    cmd = { 'TSJJoin', 'TSJSplit' },
    keys = {
      { 'gJ', '<cmd>TSJJoin<cr>', desc = 'Join Line' },
      { 'gS', '<cmd>TSJSplit<cr>', desc = 'SPlit Line' },
    },
    opts = { use_default_keymaps = false, max_join_length = 300 },
  },
  -- sort lines
  {
    'sQVe/sort.nvim',
    cmd = 'Sort',
    opts = {},
    keys = {
      -- Sort current line or selection.
      { 'go', '<Esc><Cmd>Sort<CR>', mode = { 'v' } },

      -- Sort motions.
      { 'go"', 'vi"<Esc><Cmd>Sort<CR>', desc = 'Sort inside "' },
      { "go'", "vi'<Esc><Cmd>Sort<CR>", desc = "Sort inside '" },
      { 'go(', 'vi(<Esc><Cmd>Sort<CR>', desc = 'Sort inside (' },
      { 'go{', 'vi{<Esc><Cmd>Sort<CR>', desc = 'Sort inside {}' },
      { 'go[', 'vi[<Esc><Cmd>Sort<CR>', desc = 'Sort inside [' },
      { 'gop', 'vip<Esc><Cmd>Sort<CR>', desc = 'Sort inside paragraph' },
    },
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

  -- Markdown preview
  {
    'ellisonleao/glow.nvim',
    opts = {
      minimum_width = 120,
      minimum_height = 120,
      -- width_ratio = 0.7, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
      -- height_ratio = 0.9,
    },
    cmd = 'Glow',
  },
  'wookayin/vim-typora',

  --handling CSV data with Vim
  {
    'chrisbra/csv.vim',
    lazy = false,
  },

  {
    'ray-x/lsp_signature.nvim',
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

  {
    url = 'https://gitlab.com/schrieveslaach/sonarlint.nvim',
    enabled = false,
    event = 'LspAttach',
    opts = {
      server = {
        cmd = {
          'sonarlint-language-server',
          -- Ensure that sonarlint-language-server uses stdio channel
          '-stdio',
          '-analyzers',
          -- paths to the analyzers you need, using those for python and java in this example
          vim.fn.expand '$MASON/share/sonarlint-analyzers/sonarcfamily.jar',
          vim.fn.expand '$MASON/share/sonarlint-analyzers/sonarpython.jar',
          vim.fn.expand '$MASON/share/sonarlint-analyzers/sonarcgo.jar',
          vim.fn.expand '$MASON/share/sonarlint-analyzers/sonarjs.jar',
        },
      },
      filetypes = {
        -- Tested and working
        'go',
        'css',
        'python',
        'typescript',
        'javascript',
      },
    },
  },
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('refactoring').setup()
    end,
  },
}
