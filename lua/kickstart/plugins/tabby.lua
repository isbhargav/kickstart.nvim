-- beautify vim tabs
return {
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
}
