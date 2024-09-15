return {
  'akinsho/git-conflict.nvim',
  version = '*',
  event = 'BufRead',
  opts = {
    disable_diagnostics = true,
    highlights = { incoming = 'DiffChange', current = 'DiffAdd' },
  },
}
