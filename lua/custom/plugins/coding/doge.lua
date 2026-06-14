-- doc gen
---@module "lazy"
---@type LazySpec
return {
  'kkoomen/vim-doge',
  build = ':call doge#install()',
  config = function()
    vim.cmd [[let g:doge_mapping='<Leader>dc']]
  end,
}
