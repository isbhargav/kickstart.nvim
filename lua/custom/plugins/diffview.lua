-- diffview
return {
  'sindrets/diffview.nvim',
  -- event="VeryLazy",
  cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    use_icons = false,
  },
}
