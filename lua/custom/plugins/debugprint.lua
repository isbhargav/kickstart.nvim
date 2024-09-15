return {
  'andrewferrier/debugprint.nvim',
  version = '*', -- Remove if you DON'T want to use the stable version
  dependencies = {
    'echasnovski/mini.nvim', -- Needed for :ToggleCommentDebugPrints (not needed for NeoVim 0.10+)
  },
  opts = {
    keymaps = {
      normal = {
        plain_below = '<leader>dd',
        -- plain_above = "g?P",
        variable_below = '<leader>dp',
        -- variable_above = "g?V",
        variable_below_alwaysprompt = '<leader>dP',
        -- variable_above_alwaysprompt = "",
        -- textobj_below = "g?o",
        -- textobj_above = "g?O",
        -- toggle_comment_debug_prints = "",
        -- delete_debug_prints = "",
      },
      -- insert = {
      --     plain = "<C-G>p",
      --     variable = "<C-G>v",
      -- },
      visual = {
        variable_below = '<leader>dp',
        -- variable_above = "g?V",
      },
    },
    commands = {
      toggle_comment_debug_prints = 'ToggleCommentDebugPrints',
      delete_debug_prints = 'DeleteDebugPrints',
      reset_debug_prints_counter = 'ResetDebugPrintsCounter',
    },
  },
}
