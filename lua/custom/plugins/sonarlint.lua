return {
  url ="https://gitlab.com/schrieveslaach/sonarlint.nvim",
  config=function ()
    require('sonarlint').setup({
      server = {
        cmd = {
          'sonarlint-language-server',
          -- Ensure that sonarlint-language-server uses stdio channel
          '-stdio',
          '-analyzers',
          -- paths to the analyzers you need, using those for python and java in this example
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcgo.jar"),
        }
      },
      filetypes = {
        -- Tested and working
        'javascript',
        'typescript',
        'python',
        'go',
      }
    })
  end

}
