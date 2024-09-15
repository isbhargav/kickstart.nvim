-- beautify vim tabs
return {
  {
    'nanozuki/tabby.nvim',
    event = 'VeryLazy',
    opts = {
      preset = 'active_wins_at_tail',
      theme = {
        fill = 'TabLineFill', -- tabline background
        head = 'TabLine', -- head element highlight
        current_tab = 'TabLineSel', -- current tab label highlight
        tab = 'TabLine', -- other tab label highlight
        win = 'TabLine', -- window highlight
        tail = 'TabLine', -- tail element highlight
      },
      nerdfont = true, -- whether use nerdfont
      lualine_theme = nil,
      tab_name = {
        name_fallback = function()
          return 'No Name'
        end,
      },
      buf_name = { mode = 'tail' },
    },
  },
  {
    'hasansujon786/nvim-navbuddy',
    cmd = 'SymbolsOutline',
    dependencies = {
      'SmiteshP/nvim-navic',
      'MunifTanjim/nui.nvim',
    },
    opts = { lsp = { auto_attach = true }, window = { size = '99%' } },
    keys = { { '<leader>nb', '<cmd>Navbuddy<cr>', desc = 'Nav buddy' } },
  },
}
