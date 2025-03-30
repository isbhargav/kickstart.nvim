local openrouter_adapter = function()
  return require('codecompanion.adapters').extend('openai_compatible', {
    env = {
      url = 'https://openrouter.ai/api',
      api_key = 'OPENROUTER_API_KEY',
      chat_url = '/v1/chat/completions',
    },
    schema = {
      model = {
        -- default = 'openrouter/auto',
        default = 'google/gemini-2.5-pro-exp-03-25:free',
      },
    },
  })
end

---log_level
---@module "lazy"
---@type LazySpec
return {
  'olimorris/codecompanion.nvim',
  keys = {
    { '<leader>q', '<cmd>CodeCompanionChat Toggle<cr>', desc = 'Toggle CodeCompanion chat window' },
    { 'zq', '<cmd>CodeCompanionChat<cr>', desc = 'CodeCompanion chat window with selection', mode = { 'v' } },
    { '<c-g>', '<cmd>CodeCompanionActions<cr>', desc = 'CodeCompanion chat window with selection', mode = { 'n', 'v' } },
    { '<c-space>', '<cmd>CodeCompanion<cr>', desc = 'CodeCompanion chat window with selection', mode = { 'n', 'v' } },
    -- vim.keymap.set({ "n", "v" }, "<Leader>aj", "<cmd>CodeCompanion<cr>", opts)
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    opts = {
      log_level = 'DEBUG',
    },
    adapters = {
      opts = { show_defaults = false },
      openrouter = openrouter_adapter,
    },
    strategies = {
      chat = {
        adapter = 'openrouter', -- model = 'anthropic/claude-3.5-sonnet',
        -- adapter = 'anthropic',
      },
      inline = {
        adapter = 'openrouter', --model = 'google/gemini-2.0-flash-001',
        -- adapter = 'anthropic',
      },
    },
  },
}
