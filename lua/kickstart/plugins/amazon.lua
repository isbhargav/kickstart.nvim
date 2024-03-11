return {
  '/apollo/env/envImprovement/vim/amazon/brazil-config/',
  url = 'ladbh@git.amazon.com:pkg/NinjaHooks',
  branch = 'mainline',
  config = function(plugin)
    vim.opt.rtp:append(plugin.dir .. '/configuration/vim/amazon/brazil-config')
    local bufcheck = vim.api.nvim_create_augroup('bufcheck', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
      group = bufcheck,
      pattern = 'Config',
      callback = function()
        vim.cmd 'setf brazilconfig'
        vim.keymap.set('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
        vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
      end,
    })
    --------------------------------
    -- Barium
    --------------------------------
    local lspconfig = require 'lspconfig'
    local configs = require 'lspconfig.configs'

    -- Check if the config is already defined (useful when reloading this file)
    if not configs.barium then
      configs.barium = {
        default_config = {
          cmd = { 'barium' },
          filetypes = { 'brazilconfig' },
          root_dir = function(fname)
            return lspconfig.util.find_git_ancestor(fname)
          end,
          settings = {},
        },
      }
    end

    lspconfig.barium.setup {}
  end,
}
