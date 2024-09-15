-- split/join lines
return {
  {
    'Wansmer/treesj',
    cmd = { 'TSJJoin', 'TSJSplit' },
    keys = {
      { 'gJ', '<cmd>TSJJoin<cr>', desc = 'Join Line' },
      { 'gS', '<cmd>TSJSplit<cr>', desc = 'SPlit Line' },
    },
    opts = { use_default_keymaps = false, max_join_length = 300 },
  },
}
