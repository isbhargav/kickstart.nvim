---@module "lazy"
---@type LazySpec
return {
  'ahmedkhalf/project.nvim',
  main = 'project_nvim',
  ---@module 'project_nvim'
  ---@type ProjectOptions
  opts = {
    patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', '.mise.toml' },
  },
}
