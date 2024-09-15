---@module "lazy"
---@type LazySpec
return {
  {
    'scottmckendry/cyberdream.nvim',
    event = { 'ColorScheme', 'UiEnter' },
    enabled = true,
    priority = 1000,
    config = function()
      require('cyberdream').setup {
        variant = 'auto',
        transparent = false,
        borderless_pickers = false,
        italic_comments = true,
        hide_fillchars = true,
        terminal_colors = false,
        cache = false,
        overrides = function(c)
          return {
            CursorLine = { bg = c.bg },
            CursorLineNr = { fg = c.fg },
          }
        end,
        -- Override colors
        colors = {
          -- For a list of colors see `lua/cyberdream/colours.lua`
          -- bg = '#181818', -- Editor Background
          -- -- bg = '#000000', -- Editor Background
          -- -- bg_highlight = '#3c4048',
          -- fg = '#d6d6dd', -- Default Foreground
          bg = '#111111', -- Editor Background
          bg_highlight = '#1e1e1e',
          fg = '#cccccc', -- Default Foreground

          -- Primary Colors
          blue = '#87c3ff',
          purple = '#AA9BF5',
          pink = '#e394dc',
          orange = '#efb080',
          yellow = '#f8c762',
          cyan = '#83d6c5',
          green = '#15ac91',
          red = '#f14c4c',
          warn_orange = '#ea7620',
          info_blue = '#228df2',
          white = '#d6d6dd',
        },
      }
      vim.cmd.colorscheme 'cyberdream'
    end,
  },
}
