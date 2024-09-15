return {
  'akinsho/git-conflict.nvim',
  version = '*',
  enabled = false,
  event = 'BufRead',
  opts = {
    disable_diagnostics = true,
    highlights = { incoming = 'DiffChange', current = 'DiffAdd' },
  },
}
