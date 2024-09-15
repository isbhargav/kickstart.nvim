---@module "lazy"
---@type LazySpec
return {
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
      cache = true,
      overrides = function(c)
        return {
          -- Core UI
          Normal = { fg = c.foreground, bg = c.background },
          CursorLine = { bg = c.dark_bg },
          CursorColumn = { bg = c.dark_bg },
          LineNr = { fg = c.gray },
          CursorLineNr = { fg = c.white, bold = true },
          Comment = { fg = c.comment, italic = true },
          Visual = { bg = c.bright_black },
          Search = { bg = c.yellow, fg = c.black },
          IncSearch = { bg = c.orange, fg = c.black },
          Error = { fg = c.red },
          WarningMsg = { fg = c.yellow },
          Title = { fg = c.blue, bold = true },
          Pmenu = { fg = c.foreground, bg = c.black },
          PmenuSel = { fg = c.white, bg = c.blue },
          StatusLine = { fg = c.white, bg = c.gray },
          StatusLineNC = { fg = c.gray, bg = c.dark_bg },

          -- Standard syntax groups
          String = { fg = c.pink },
          Character = { fg = c.pink },
          Number = { fg = c.orange },
          Boolean = { fg = c.orange },
          Float = { fg = c.orange },
          Identifier = { fg = c.alt_blue },
          Function = { fg = c.orange, bold = true },
          Method = { fg = c.orange, bold = true },
          Keyword = { fg = c.cyan },
          Conditional = { fg = c.cyan },
          Repeat = { fg = c.cyan },
          Label = { fg = c.orange },
          Operator = { fg = c.foreground },
          Statement = { fg = c.blue },
          Constant = { fg = c.bright_green },
          Type = { fg = c.blue },
          PreProc = { fg = c.orange },
          Special = { fg = c.blue },
          Underlined = { fg = c.cyan, underline = true },
          Todo = { fg = c.yellow, bg = c.background },

          -- Tree-sitter highlight groups
          ['@TSComment'] = { link = 'Comment' },
          ['@TSConstant'] = { fg = c.bright_green },
          ['@TSConstBuiltin'] = { fg = c.bright_cyan },
          ['@TSConstMacro'] = { fg = c.bright_green },
          ['@TSString'] = { fg = c.pink },
          ['@TSCharacter'] = { fg = c.pink },
          ['@TSNumber'] = { fg = c.orange },
          ['@TSBoolean'] = { fg = c.orange },
          ['@TSFloat'] = { fg = c.orange },
          ['@TSFunction'] = { fg = c.orange },
          ['@TSFuncBuiltin'] = { fg = c.bright_cyan },
          ['@TSMethod'] = { fg = c.orange, bold = true },
          ['@TSParameter'] = { fg = c.bright_yellow },
          ['@TSParameterReference'] = { fg = c.bright_yellow },
          ['@TSField'] = { fg = c.alt_blue },
          ['@TSProperty'] = { fg = c.alt_blue },
          ['@TSConstructor'] = { fg = c.orange },
          ['@TSConditional'] = { fg = c.cyan },
          ['@TSRepeat'] = { fg = c.cyan },
          ['@TSLabel'] = { fg = c.orange },
          ['@TSOperator'] = { fg = c.foreground },
          ['@TSException'] = { fg = c.red },
          ['@TSType'] = { fg = c.blue },
          ['@TSTypeBuiltin'] = { fg = c.blue },
          ['@TSNamespace'] = { fg = c.blue },
          ['@TSInclude'] = { fg = c.orange },
          ['@TSVariable'] = { fg = c.alt_blue },
          ['@TSVariableBuiltin'] = { fg = c.bright_cyan },
        }
      end,
      -- Override colors
      colors = {
        -- -- For a list of colors see `lua/cyberdream/colours.lua`
        alt_blue = '#AA9BF5',
        background = '#1a1a1a', -- editor.background
        beige = '#E3C893',
        black = '#2A2A2A',
        blue = '#81A1C1',
        bright_black = '#404040',
        bright_blue = '#87c3ff',
        bright_cyan = '#82d2ce',
        bright_green = '#83d6c5',
        bright_yellow = '#f8c762',
        comment = '#999999',
        cyan = '#88C0D0',
        dark_bg = '#292929', -- line highlight
        foreground = '#D8DEE9', -- editor.foreground
        gray = '#505050',
        green = '#A3BE8C',
        light_gray = '#CCCCCC', -- for borders, secondary fg
        magenta = '#B48EAD',
        orange = '#efb080',
        pink = '#e394dc',
        red = '#BF616A',
        white = '#FFFFFF',
        yellow = '#EBCB8B',
      },
    }

    vim.cmd.colorscheme 'cyberdream'
  end,
}
