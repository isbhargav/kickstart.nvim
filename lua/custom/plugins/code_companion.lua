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
    strategies = {
      chat = {
        adapter = 'anthropic',
        -- adapter = 'gemini',
      },
      inline = {
        adapter = 'anthropic',
        -- adapter = 'gemini',
      },
    },
  },
}
