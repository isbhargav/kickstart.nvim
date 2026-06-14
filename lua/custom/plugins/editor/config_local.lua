---@module "lazy"
---@type LazySpec
return {
  'klen/nvim-config-local',
  lazy = false,
  opts = {
    silent = true,
    -- Config file patterns to load (lua supported)
    config_files = {
      '.nvim.lua',
      '.nvimrc',
      '.exrc',
      '.init.lua',
    },
  },
}
