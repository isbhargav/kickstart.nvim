return {
  'junegunn/gv.vim',
  dependencies = { 'tpope/vim-fugitive' },
  cmd = { 'GV' },
  config = function()
    -- Diff with previous commit on GV
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('diffview-gv', { clear = true }),
      pattern = 'GV',
      callback = function()
        vim.keymap.set('n', ',', function()
          local curr_line = vim.api.nvim_get_current_line()
          local _, sha, _ = string.match(curr_line, '(^*%d%d%d%d--%d%d--%d%d%s)(%x+)(%s.*)')
          if sha ~= nil then
            vim.api.nvim_input(':DiffviewOpen ' .. sha .. '^!')
          end
        end)
      end,
    })

    -- Diff between selected range of commits
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('diffview-gv-v', { clear = true }),
      pattern = 'GV',
      callback = function()
        vim.keymap.set('v', ',', function()
          local line_number_start = vim.fn.line 'v' - 1
          local line_number_end = vim.fn.line '.' - 1

          local first_line = vim.api.nvim_buf_get_lines(0, line_number_start, line_number_start + 1, false)
          local last_line = vim.api.nvim_buf_get_lines(0, line_number_end, line_number_end + 1, false)

          if #first_line == 1 and #last_line == 1 then
            local _, sha1, _ = string.match(first_line[1], '(^*%d%d%d%d--%d%d--%d%d%s)(%x+)(%s.*)')
            local _, sha2, _ = string.match(last_line[1], '(^*%d%d%d%d--%d%d--%d%d%s)(%x+)(%s.*)')

            if sha1 ~= nil and sha2 ~= nil then
              local cmd = ':<BS><BS><BS><BS><BS>DiffviewOpen ' .. sha2 .. '..' .. sha1
              vim.api.nvim_input(cmd)
            end
          end
        end)
      end,
    })
  end,
  keys = {
    { '<leader>gv', '<cmd>GV<cr>', mode = 'n', desc = '[G]it [V]ertical Graph' },
    { '<leader>gv', "<cmd>'<,'>GV<cr>", mode = 'v', desc = '[G]it [V]ertical Graph' },
  },
}
