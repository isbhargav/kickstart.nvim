return {
  'Skardyy/makurai-nvim',
  enabled = false,
  config = function()
    -- you don't have to call setup
    require('makurai').setup {
      transparent = true, -- removes the bg color
    }

    vim.cmd.colorscheme 'makurai'
  end,
}
