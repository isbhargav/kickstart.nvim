return {
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
}
