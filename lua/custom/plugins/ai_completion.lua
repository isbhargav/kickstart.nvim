return {
  {
    'github/copilot.vim',
    enabled = false,
  },
  {
    'folke/sidekick.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<tab>',
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require('sidekick').nes_jump_or_apply() then
            vim.notify('No suggestion available', 'info', { style = 'minimal' })
            return '<Tab>' -- fallback to normal tab
          end
        end,
        expr = true,
        desc = 'Goto/Apply Next Edit Suggestion',
      },
      {
        '<leader>aa',
        function()
          require('sidekick.cli').toggle { name = 'opencode' }
        end,
        desc = 'Sidekick Toggle CLI',
      },
      {
        '<leader>ap',
        function()
          require('sidekick.cli').prompt()
        end,
        mode = { 'n', 'x' },
        desc = 'Sidekick Select Prompt',
      },
      {
        '<leader>av',
        function()
          require('sidekick.cli').send { msg = '{selection}' }
        end,
        mode = { 'x' },
        desc = 'Send Visual Selection',
      },
    },
    opts = {
      cli = {
        -- win = {
        --   layout = 'float',
        --   float = { border = 'rounded' },
        -- },
        mux = {
          backend = 'tmux',
          enabled = true,
        },
      },
    },
  },

  {
    'supermaven-inc/supermaven-nvim',
    -- dir = '/Users/bhargavlad/OSS/supermaven-nvim',
    on_event = 'VeryLazy',
    config = function()
      require('supermaven-nvim').setup {
        keymaps = {
          accept_suggestion = '<C-l>',
          accept_word = '<C-j>',
          clear_suggestion = '<C-]>',
        },
        ignore_filetypes = {
          'config.fish',
          'fish',
        }, -- or { "cpp", }
        -- color = {
        --   suggestion_color = '#ffffff',
        --   cterm = 244,
        -- },
        log_level = 'info', -- set to "off" to disable logging completely
        disable_inline_completion = false, -- disables inline completion for use with cmp
        disable_keymaps = false, -- disables built in keymaps for more manual control
        condition = function()
          return false
        end, -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
      }
    end,
  },
}
