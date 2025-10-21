-- za	Toggle folds. By LSP and nvim-ufo they are automatically added to supported files in smart way.
-- zM	Close all folds
-- zR	Open all folds
-- zr	Open all folds except imports/comments

return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  init = function()
    vim.o.foldcolumn = '0'
    -- vim.o.foldcolumn = '1' -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
    -- vim.keymap.set('n', 'zR', require('ufo').openAllFolds,{desc=""})
    -- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    -- vim.keymap.set('n', 'zr', function()
    --   require('ufo').openFoldsExceptKinds()
    -- end)
    -- vim.keymap.set('n', 'zm', function()
    --   require('ufo').closeFoldsWith(3)
    -- end)

    vim.keymap.set('n', 'zR', function()
      require('ufo').openAllFolds()
    end, { desc = 'Open all folds' })
    vim.keymap.set('n', 'zM', function()
      require('ufo').closeAllFolds()
    end, { desc = 'Close all folds' })
    vim.keymap.set('n', 'zr', function()
      require('ufo').openFoldsExceptKinds()
    end, { desc = 'Fold less' })
    vim.keymap.set('n', 'zm', function()
      require('ufo').closeFoldsWith()
    end, { desc = 'Fold more' })
    vim.keymap.set('n', 'zp', function()
      require('ufo').peekFoldedLinesUnderCursor()
    end, { desc = 'Peek fold' })
    vim.keymap.set('n', 'zn', function()
      require('ufo').openFoldsExceptKinds { 'comment' }
    end, { desc = 'Fold comments' })
    vim.keymap.set('n', 'zN', function()
      require('ufo').openFoldsExceptKinds { 'region' }
    end, { desc = 'Fold region' })
    --
    --  https://nanotipsforvim.prose.sh/stop-yourself-from-overnesting
    vim.cmd.highlight 'Overnesting guibg=#E06C75'
    vim.fn.matchadd('Overnesting', ('\t'):rep(5) .. '\t*')
  end,
  opts = {
    provider_selector = function(bufnr, filetype, buftype)
      return { 'treesitter', 'indent' }
    end,
    fold_virt_text_handler = function(virt_text, lnum, end_lnum, width, truncate)
      local new_virt_text = {}
      local suffix = (' ↲ %d '):format(end_lnum - lnum)
      local suf_width = vim.fn.strdisplaywidth(suffix)
      local target_width = width - suf_width
      local cur_width = 0
      for _, chunk in ipairs(virt_text) do
        local chunk_text = chunk[1]
        local chunk_width = vim.fn.strdisplaywidth(chunk_text)
        if target_width > cur_width + chunk_width then
          table.insert(new_virt_text, chunk)
        else
          chunk_text = truncate(chunk_text, target_width - cur_width)
          local hl_group = chunk[2]
          table.insert(new_virt_text, { chunk_text, hl_group })
          chunk_width = vim.fn.strdisplaywidth(chunk_text)
          if cur_width + chunk_width < target_width then
            suffix = suffix .. ('.'):rep(target_width - cur_width - chunk_width)
          end
          break
        end
        cur_width = cur_width + chunk_width
      end
      table.insert(new_virt_text, { suffix, 'UfoFoldVirtText' })
      table.insert(new_virt_text, { ('.'):rep(vim.fn.UfoWidth()), 'Comment' })
      return new_virt_text
    end,
    enable_get_fold_virt_text = true,
    -- fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate, ctx)
    --   for i = lnum, endLnum do
    --     print('lnum: ', i, ', virtText: ', vim.inspect(ctx.get_fold_virt_text(i)))
    --   end
    --   return virtText
    -- end,
  },
}

-- maps.n["zR"] = { function() require("ufo").openAllFolds() end, desc = "Open all folds" }
-- maps.n["zM"] = { function() require("ufo").closeAllFolds() end, desc = "Close all folds" }
-- maps.n["zr"] = { function() require("ufo").openFoldsExceptKinds() end, desc = "Fold less", }
-- maps.n["zm"] = { function() require("ufo").closeFoldsWith() end, desc = "Fold more" }
-- maps.n["zp"] = { function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek fold", }
-- maps.n["zn"] = { function() require("ufo").openFoldsExceptKinds({'comment'}) end, desc = "Fold comments" }
-- maps.n["zN"] = { function() require("ufo").openFoldsExceptKinds({'region'}) end, desc = "Fold region" }
