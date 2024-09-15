return {
  {
    'github/copilot.vim',
    enabled = false,
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
  {
    'milanglacier/minuet-ai.nvim',
    enabled = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      virtualtext = {
        auto_trigger_ft = { 'c', 'python', 'sh', 'rust', 'js' },
        keymap = {
          -- accept whole completion
          accept = '<C-l>',
          -- accept one line
          --accept_line = '<A-a>',
          -- accept n lines (prompts for number)
          -- e.g. "A-z 2 CR" will accept 2 lines
          --accept_n_lines = '<A-z>',
          -- Cycle to prev completion item, or manually invoke completion
          prev = '<C-k>',
          -- Cycle to next completion item, or manually invoke completion
          next = '<C-j>',
          dismiss = '<C-c>',
        },
      },
      provider = 'openai_compatible',
      n_completions = 2, -- keep small for resource saving
      provider_options = {
        claude = {
          max_tokens = 128,
          model = 'claude-3-7-sonnet-20250219',
        },
        openai = {
          optional = {
            max_tokens = 256,
          },
        },
        openai_compatible = {
          end_point = 'https://openrouter.ai/api/v1/chat/completions',
          model = 'mistralai/devstral-small-2505',
          stream = true,
          api_key = 'OPENROUTER_API_KEY',
          name = 'Openrouter',
          optional = {
            stop = nil,
            max_tokens = 256,
            -- max_tokens = nil,
          },
        },
      },
    },
  },
}
