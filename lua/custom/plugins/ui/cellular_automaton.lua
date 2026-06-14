-- FML
---@module "lazy"
---@type LazySpec
return {
  'eandrju/cellular-automaton.nvim',
  cmd = 'CellularAutomaton',
  keys = {
    { '<leader>fml', '<cmd>CellularAutomaton make_it_rain<CR>', desc = 'Desc' },
  },
}
