-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- Plugins are organized into category subfolders to keep things easy to find
-- and update. Each plugin lives in its own file inside one of these folders.
-- To add a plugin, drop a new `*.lua` file (returning a LazySpec) into the
-- folder that fits best. To add a whole new category, create a folder and add
-- an `{ import = '...' }` line below.
--
-- See the kickstart.nvim README for more information
---@module "lazy"
---@type LazySpec
return {
  { import = 'custom.plugins.ai' }, -- copilot, supermaven, sidekick
  { import = 'custom.plugins.completion' }, -- blink.cmp
  { import = 'custom.plugins.coding' }, -- editing: autopairs, comment, surround, conform, align...
  { import = 'custom.plugins.lsp' }, -- lint, trouble, ufo, treesitter-context...
  { import = 'custom.plugins.git' }, -- gitsigns, diffview, gv, git-conflict
  { import = 'custom.plugins.ui' }, -- colorschemes, statusline/tabline, snacks, markdown...
  { import = 'custom.plugins.editor' }, -- files, navigation, project, tmux, tpope...
  { import = 'custom.plugins.testing' }, -- dap, vim-test, coverage, compile-mode
  { import = 'custom.plugins.db' }, -- dadbod
}
