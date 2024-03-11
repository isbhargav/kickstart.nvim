-- vim test
return {
  'vim-test/vim-test',
  event = 'VeryLazy',
  config = function()
    --  Brazil compatiible VIM Test for python packages
    vim.cmd [[
              let test#python#runner = 'pytest'
              " let test#python#pytest#executable = 'brazil-test-exec pytest -v -s '
              let test#python#pytest#executable = 'brazil-test-exec pytest -v -s --pdbcls=IPython.terminal.debugger:TerminalPdb'
              ]]

    -- change command for react projects
    vim.cmd [[
              " let test#javascript#runner = 'jest'
              " let test#javascript#jest#executable = 'npx jest'

              " let test#javascript#reactscripts#executable = "TZ=UTC npx react-scripts test --verbose --transformIgnorePatterns \"node_modules/(?!(@amzn/awsui-)).+\\.js$\" --timers modern --watchAll=false"
              ]]

    -- " let test#javascript#pytest#executable = 'brazil-build react-scripts test'

    -- for neovim
    vim.cmd [[
              let test#strategy = "neovim"
              let test#neovim#term_position = "vert botright"
              ]]

    -- vim.cmd([[
    -- function! EchoStrategy(cmd)
    --   echo 'It works! Command for running tests: ' . a:cmd
    -- endfunction
    --
    -- let g:test#custom_strategies = {'echo': function('EchoStrategy')}
    -- let g:test#strategy = 'echo'
    -- ]])

    --Vim-test mappings
    vim.keymap.set('n', '<leader>t', ':w<CR>:TestNearest<CR>')
    vim.keymap.set('n', '<leader>T', ':w<CR>:TestFile<CR>')
    vim.keymap.set('n', '<leader>l', ':w<CR>:TestLast<CR>')
    vim.keymap.set('n', '<leader>g', ':w<CR>:TestVisit<CR>')
    vim.keymap.set('n', '<leader>a', ':w<CR>:TestSuite<CR>')
  end,
}
