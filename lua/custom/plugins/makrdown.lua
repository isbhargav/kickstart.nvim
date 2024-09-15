return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    heading = {
      sign = false,
      border = true,
      below = '▔',
      above = '▁',
      left_pad = 0,
      position = 'left',
      icons = {
        '█ ',
        '██ ',
        '███ ',
        '████ ',
        '█████ ',
        '██████ ',
      },
    },
    code = {
      sign = false,
      border = 'thin',
      position = 'right',
      width = 'block',
      above = '▁',
      below = '▔',
      language_left = '█',
      language_right = '█',
      language_border = '▁',
      left_pad = 1,
      right_pad = 1,
    },
  },
}
