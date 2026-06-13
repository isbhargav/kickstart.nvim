return {
  { 'github/copilot.vim', enabled = false },
  {
    'supermaven-inc/supermaven-nvim',
    priority = 1000,
    config = function()
      require('supermaven-nvim').setup {
        disable_keymaps = true,
        log_level = 'error',
        color = {
          suggestion_color = '#8a7a6a',
          cterm = 101,
        },
        ignore_filetypes = {
          'config.fish',
          'fish',
          'env',
          'mise.toml',
        }, -- or { "cpp", }
      }

      local completion_preview = require 'supermaven-nvim.completion_preview'
      vim.keymap.set('i', '<c-l>', completion_preview.on_accept_suggestion, { noremap = true, silent = true })
      vim.keymap.set('i', '<c-j>', completion_preview.on_accept_suggestion_word, { noremap = true, silent = true })
    end,
  },
}
