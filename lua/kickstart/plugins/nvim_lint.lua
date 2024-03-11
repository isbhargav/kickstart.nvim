return {
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      python = { 'flake8', 'mypy', 'cspell' },
      javascript = { 'eslint_d', 'cspell' },
      typescript = { 'eslint_d',  'cspell' },
    }

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      callback = function()
        lint.try_lint()
        -- lint.try_lint 'cspell' -- global linter, apply to all files
      end,
    })

    --
    vim.api.nvim_buf_create_user_command(0, 'Lint', function(_)
      lint.try_lint()
    end, { desc = 'Lint current buffer with configured Linters' })
  end,
}
