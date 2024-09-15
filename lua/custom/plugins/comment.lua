return {
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    main = 'ts_context_commentstring',
    opts = {},
  },
  -- {
  --   'folke/ts-comments.nvim',
  --   opts = {},
  --   event = 'VeryLazy',
  --   enabled = vim.fn.has 'nvim-0.10.0' == 1,
  -- },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        pre_hook = function()
          return vim.bo.commentstring
        end,
      }
    end,
  },
}
