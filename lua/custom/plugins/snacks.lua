return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  init = function()
    -- LSP Integrated support
    vim.api.nvim_create_autocmd('User', {
      pattern = 'OilActionsPost',
      callback = function(event)
        if event.data.actions.type == 'move' then
          Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
        end
      end,
    })
  end,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    indent = {
      enabled = true,
      animate = { enabled = false },
      -- this is what makes the scope look like an arrow
      chunk = { enabled = true },
    },
    quickfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    picker = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
}
