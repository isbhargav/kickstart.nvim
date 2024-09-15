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
  -- lazy.nvim
  {
    '2nthony/sortjson.nvim',
    cmd = {
      'SortJSONByAlphaNum',
      'SortJSONByAlphaNumReverse',
      'SortJSONByKeyLength',
      'SortJSONByKeyLengthReverse',
    },
    -- options with default values
    opts = {
      jq = 'jq', -- jq command, you can try `jaq` `gojq` etc.
      log_level = 'WARN', -- log level, see `:h vim.log.levels`, when parsing json failed
    },
  },
}
