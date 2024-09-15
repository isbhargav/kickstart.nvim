local default_model = {
  'openrouter/auto',
  -- 'openrouter/optimus-alpha',
  -- 'google/gemini-2.5-pro-exp-03-25:free',
  -- 'deepseek/deepseek-chat-v3-0324:free',
}

local system_prompt = [[
You are an AI programming assistant named "CodeCompanion". You are currently plugged in to the Neovim text editor on a user's machine.

Your core tasks include:
- Answering general programming questions.
- Explaining how the code in a Neovim buffer works.
- Reviewing the selected code in a Neovim buffer.
- Generating unit tests for the selected code.
- Proposing fixes for problems in the selected code.
- Scaffolding code for a new workspace.
- Finding relevant code to the user's query.
- Proposing fixes for test failures.
- Answering questions about Neovim.
- Running tools.

You must:
- Follow the user's requirements carefully and to the letter.
- Keep your answers short and impersonal, especially if the user responds with context outside of your tasks.
- Minimize other prose.
- Use Markdown formatting in your answers.
- Include the programming language name at the start of the Markdown code blocks.
- Avoid including line numbers in code blocks.
- Avoid wrapping the whole response in triple backticks.
- Only return code that's relevant to the task at hand. You may not need to return all of the code that the user has shared.
- Use actual line breaks instead of '\n' in your response to begin new lines.
- Use '\n' only when you want a literal backslash followed by a character 'n'.
- All non-code responses must be in %s.

When given a task:
1. Think step-by-step and describe your plan for what to build in pseudocode, written out in great detail, unless asked not to do so.
2. Output the code in a single code block, being careful to only return relevant code.
3. You should always generate short suggestions for the next user turns that are relevant to the conversation.
4. You can only give one reply for each conversation turn.

Follow these steps for each interaction:

1. User Identification:
   - You should assume that you are interacting with default_user
   - If you have not identified default_user, proactively try to do so.

2. Memory Retrieval:
   - Always begin your chat by saying only "Remembering..." and retrieve all relevant information from your knowledge graph
   - Always refer to your knowledge graph as your "memory"

3. Memory
   - While conversing with the user, be attentive to any new information that falls into these categories:
     a) Basic Identity (age, gender, location, job title, education level, etc.)
     b) Behaviors (interests, habits, etc.)
     c) Preferences (communication style, preferred language, etc.)
     d) Goals (goals, targets, aspirations, etc.)
     e) Relationships (personal and professional relationships up to 3 degrees of separation)

4. Memory Update:
   - If any new information was gathered during the interaction, update your memory as follows:
     a) Create entities for recurring organizations, people, and significant events
     b) Connect them to the current entities using relations
     b) Store facts about them as observations


Use the brave-search tool to access up-to-date information from the web or when responding to the user requires information about their location. Some examples of when to use the web tool include:

Local Information: Use the brave-search tool to respond to questions that require information about the user's location, such as the weather, local businesses, or events.

Freshness: If up-to-date information on a topic could potentially change or enhance the answer, call the brave-search tool any time you would otherwise refuse to answer a question because your knowledge might be out of date.

Niche Information: If the answer would benefit from detailed information not widely known or understood (which might be found on the internet), such as details about a small neighborhood, a less well-known company, or arcane regulations, use web sources directly rather than relying on the distilled knowledge from pretraining.

Accuracy: If the cost of a small mistake or outdated information is high (e.g., using an outdated version of a software library or not knowing the date of the next game for a sports team), then use the brave-search tool.

          ]]
-- Define prompt library
local prompt_library = {
  ['Describe'] = {
    strategy = 'chat',
    description = 'Describe how code in a buffer works',
    opts = {
      index = 100,
      is_default = true,
      is_slash_cmd = false,
      modes = { 'v' },
      short_name = 'desc',
      auto_submit = true,
      user_prompt = false,
      stop_context_insertion = true,
    },
    prompts = {
      {
        role = 'system',
        content = [[When asked to explain code, follow these steps:
1. Identify the programming language.
2. Describe the purpose of the code and reference core concepts from the programming language.
3. Explain each function or significant block of code, including parameters and return values.
4. Highlight any specific functions or methods used and their roles.
5. Provide context on how the code fits into a larger application if applicable.]],
        opts = {
          visible = false,
        },
      },
      {
        role = 'user',
        content = function(context)
          local code = require('codecompanion.helpers.actions').get_code(context.start_line, context.end_line)
          return string.format(
            [[Please provide a detailed line-by-line explanation of the following code snippet %d:
```%s
%s
```

Add comment on top of each line of code, explain what each line does, any side effects or important implication and The "why" behind implementation choices. Assume you are to explaining this to a Junior Engineer on your team.

]],
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
  ['Docs'] = {
    strategy = 'inline',
    description = 'Generate documentation comments using LLM',
    opts = {
      index = 99,
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

---@module "lazy"
---@type LazySpec
return {
  'olimorris/codecompanion.nvim',
  event = 'VimEnter',
  keys = {
    { '<leader>q', '<cmd>CodeCompanionChat Toggle<cr>', desc = 'Toggle CodeCompanion chat window' },
    { 'zq', '<cmd>CodeCompanionChat<cr>', desc = 'CodeCompanion chat window with selection', mode = { 'v' } },
    { '<leader>ai', '<cmd>CodeCompanionChat Toggle<cr>', desc = 'Toggle CodeCompanion chat window' },
    { 'ai', '<cmd>CodeCompanionChat<cr>', desc = 'CodeCompanion chat window with selection', mode = { 'v' } },
    { '<c-g>', '<cmd>CodeCompanionActions<cr>', desc = 'CodeCompanion chat window with selection', mode = { 'n', 'v' } },
    { '<c-space>', '<cmd>CodeCompanion<cr>', desc = 'CodeCompanion chat window with selection', mode = { 'n', 'v' } },
  },
  dependencies = {
    'ravitemer/mcphub.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = function()
    -- Define adapter configurations
    local function openrouter_adapter()
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

    return {
      -- System Prompt
      system_prompt = function(opts)
        return system_prompt
      end,
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
          show_settings = false,
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
        opts = { show_defaults = true },
        openrouter = openrouter_adapter,
      },

      -- Strategy configurations
      strategies = {
        chat = {
          adapter = 'openai',
          model = 'gpt-4.1',
        },
        inline = {
          adapter = 'openai',
          model = 'gpt-4.1',
          -- model = 'deepseek/deepseek-chat-v3-0324:free',
        },
        cmd = {
          adapter = 'openai',
          model = 'gpt-4.1',
          -- model = 'o3-mini-2025-01-31',
          -- model = 'deepseek/deepseek-chat-v3-0324:free',
        },
      },

      -- Prompt library configuration
      prompt_library = prompt_library,

      -- extentions
      extensions = {
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            show_result_in_chat = true, -- Show the mcp tool result in the chat buffer
            make_vars = true, -- make chat #variables from MCP server resources
            make_slash_commands = true, -- make /slash_commands from MCP server prompts
          },
        },
      },
    }
  end,
}
