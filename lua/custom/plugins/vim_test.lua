-- vim test
return {
  'vim-test/vim-test',
  config = function()
    -- for neovim
    vim.cmd [[
              let test#strategy = "neovim"
              let test#neovim#term_position = "vert botright"
              ]]

    --Vim-test mappings
    vim.keymap.set('n', '<leader>t', ':w<CR>:TestNearest<CR>')
    vim.keymap.set('n', '<leader>T', ':w<CR>:TestFile<CR>')
    vim.keymap.set('n', '<leader>l', ':w<CR>:TestLast<CR>')
    vim.keymap.set('n', '<leader>g', ':w<CR>:TestVisit<CR>')
    vim.keymap.set('n', '<leader>a', ':w<CR>:TestSuite<CR>')
  end,
}
