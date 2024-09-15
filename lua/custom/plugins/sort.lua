-- sort lines
return {
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
}
