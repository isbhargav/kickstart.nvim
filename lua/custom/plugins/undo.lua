return {
  {
    'tzachar/highlight-undo.nvim',
    opts = {
      hlgroup = 'HighlightUndo',
      duration = 300,
      pattern = { '*' },
      ignored_filetypes = {
        'neo-tree',
        'fugitive',
        'TelescopePrompt',
        'mason',
        'lazy',
        'GV',
      },
      -- ignore_cb is in comma as there is a default implementation. Setting
      -- to nil will mean no default os called.
      -- ignore_cb = nil,
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
}
