return {
  "sotte/presenting.nvim",
  keymaps={
    {'l', '<Right>'}
  },
  opts = {
    options = {
      -- The width of the slide buffer.
      width = 90,
    },
    -- configure_slide_buffer = function(buf)
    --   vim.wo.wrap = true
    -- end,
     keymaps = {
      -- These are local mappings for the open slide buffer.
      -- Disable existing keymaps by setting them to `nil`.
      -- Add your own keymaps as you desire.
      ["l"] = function() vim.cmd('norm! l') end,

      -- ["n"] = function() require 'presenting'.next() end,
      -- ["p"] = function() require 'presenting'.prev() end,
      -- ["q"] = function() require 'presenting'.quit() end,
      -- ["f"] = function() require 'presenting'.first() end,
      -- ["l"] = function() require 'presenting'.last() end,
      -- ["<CR>"] = function() require 'presenting'.next() end,
      -- ["<BS>"] = function() require 'presenting'.prev() end,
    },
    -- fill in your options here
    -- see :help Presenting.config
  },
  cmd = { "Presenting" },
}
