---@module "lazy"
---@type LazySpec
return {
  'olimorris/codecompanion.nvim',
  event = 'VimEnter',
  keys = {
    { '<leader>ai', '<cmd>CodeCompanionChat Toggle<cr>', desc = 'Toggle CodeCompanion chat window' },
    { 'ai', '<cmd>CodeCompanionChat<cr>', desc = 'CodeCompanion chat window with selection', mode = { 'v' } },
    { '<c-g>', '<cmd>CodeCompanionActions<cr>', desc = 'CodeCompanion chat window with selection', mode = { 'n', 'v' } },
    { '<c-space>', '<cmd>CodeCompanion<cr>', desc = 'CodeCompanion chat window with selection', mode = { 'n', 'v' } },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = function()
    -- Define adapter configurations
    local function openrouter_adapter()
      local default_model = {
        -- 'openrouter/auto',
        -- 'google/gemini-2.5-pro-exp-03-25:free',
        -- 'deepseek/deepseek-chat-v3-0324:free',
        'openrouter/quasar-alpha',
      }

      return require('codecompanion.adapters').extend('openai_compatible', {
        env = {
          url = 'https://openrouter.ai/api',
          api_key = 'OPENROUTER_API_KEY',
          chat_url = '/v1/chat/completions',
        },
        schema = {
          model = {
            default = default_model[1],
          },
        },
      })
    end

    -- Define prompt library
    local prompt_library = {
      ['Docs'] = {
        strategy = 'inline',
        description = 'Generate documentation comments using LLM',
        opts = {
          -- index = 3,
          modes = { 'v' },
          is_default = true,
          is_slash_cmd = false,
          user_prompt = false,
          auto_submit = true,
        },
        prompts = {
          {
            role = 'system',
            content = function()
              return [[When asked to generate documentation, follow these steps:
1. Identify the programming language.
2. Analyze the function, method, or class structure.
3. Generate documentation comments in the appropriate style for that language (e.g., JSDoc, Python docstrings, Rust comments, etc.).
4. Include descriptions for parameters, return values, and any side effects.
5. If the code is a class or module, document its purpose and usage.
6. Keep comments concise but informative.]]
            end,
            opts = {
              visible = false,
            },
          },
          {
            role = 'user',
            content = function(context)
              local code = require('codecompanion.helpers.actions').get_code(context.start_line, context.end_line)
              return string.format(
                [[Please add documentation comments above this code from buffer %d.
Return the same code with only documentation comments added. Do not change the actual code:
```%s
%s
```]],
                context.bufnr,
                context.filetype,
                code
              )
            end,
            opts = {
              contains_code = true,
            },
          },
        },
      },
    }

    return {
      -- Display configuration
      display = {
        chat = {
          roles = {
            ---The header name for the LLM's messages
            ---@type string|fun(adapter): string
            llm = function(adapter)
              return 'AI (' .. adapter.formatted_name .. ')'
            end,

            ---The header name for your messages
            ---@type string
            user = 'Me',
          },
          show_settings = true,
          window = {
            layout = 'vertical',
            position = 'right',
          },
        },
        action_palette = {
          width = 95,
          height = 10,
          prompt = 'Prompt ', -- Prompt used for interactive LLM calls
          provider = 'telescope', -- default|telescope|mini_pick
          opts = {
            show_default_actions = true, -- Show the default actions in the action palette?
            show_default_prompt_library = true, -- Show the default prompt library in the action palette?
          },
        },
      },

      -- General options
      opts = {
        log_level = 'WARN',
      },

      -- Adapter configurations
      adapters = {
        opts = { show_defaults = false },
        openrouter = openrouter_adapter,
      },

      -- Strategy configurations
      strategies = {
        chat = {
          keymaps = { send = { modes = { n = '<CR><CR>', i = '<CR>' } } },
          adapter = 'openrouter',
        },
        inline = {
          adapter = 'openrouter',
        },
        cmd = {
          adapter = 'openrouter',
          model = 'deepseek/deepseek-chat-v3-0324:free',
        },
      },

      -- Prompt library configuration
      prompt_library = prompt_library,
    }
  end,
}
