return {
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
}
