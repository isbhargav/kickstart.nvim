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
  end,
  keys = {
    { '<leader>gv', '<cmd>GV<cr>', mode = 'n', desc = '[G]it [V]ertical Graph' },
    { '<leader>gv', "<cmd>'<,'>GV<cr>", mode = 'v', desc = '[G]it [V]ertical Graph' },
  },
}
