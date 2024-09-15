-- harpoon files
return {
  'ThePrimeagen/harpoon',
  dependencies = 'nvim-lua/plenary.nvim',
  branch = 'harpoon2',
  lazy = false,
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup {
      settings = {
        save_on_toggle = true,
      },
    }
    -- REQUIRED

    vim.keymap.set('n', '<C-p>', function()
      harpoon:list():add()
    end)
    vim.keymap.set('n', '<leader>p', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
  end,
}
