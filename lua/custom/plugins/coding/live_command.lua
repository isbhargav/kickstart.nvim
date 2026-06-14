-- live command preview (e.g. :Norm)
---@module "lazy"
---@type LazySpec
return {
  'smjonas/live-command.nvim',
  config = function()
    require('live-command').setup { commands = { Norm = { cmd = 'norm' } } }
  end,
}
