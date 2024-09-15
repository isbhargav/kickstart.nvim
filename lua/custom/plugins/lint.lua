return {
  dependencies = {
    'williamboman/mason.nvim',
    'rshkarin/mason-nvim-lint',
  },
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      python = { 'flake8', 'mypy', 'cspell' },
      javascript = { 'cspell' },
      typescript = { 'cspell' },
      javascriptreact = { 'cspell' },
      typescriptreact = { 'cspell' },
      json = { 'jsonlint' },
      markdown = { 'markdownlint' },
      -- scss = {"stylelint"},
      ['*'] = { 'typos' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = false })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        if vim.bo.modifiable then lint.try_lint() end
      end,
    })
  end,
}
