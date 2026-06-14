-- align text
---@module "lazy"
---@type LazySpec
return {
  'junegunn/vim-easy-align',
  keys = {
    { '<leader>E', '<Plug>(LiveEasyAlign)', mode = { 'n', 'v' }, desc = 'Open parent directory' },
  },
}
