-- hex colors
---@module "lazy"
---@type LazySpec
return {
  'norcalli/nvim-colorizer.lua',
  event = 'VeryLazy',
  config = function()
    require('colorizer').setup({
      'css',
      'scss',
      'javascript',
      html = { mode = 'background' },
    }, { mode = 'foreground' })
  end,
}
