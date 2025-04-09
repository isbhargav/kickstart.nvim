-- Custom settings

-- No line wrap
vim.opt.wrap = false -- turnoff line wrap
vim.opt.expandtab = true -- replace <Tab> with spaces
vim.opt.tabstop = 4 -- number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 4 -- remove <Tab> symbols as it was spaces
vim.opt.shiftwidth = 4 -- indent size for << and >>
vim.opt.shiftround = true -- round indent to multiple of 'shiftwidth' (for << and >>)
vim.opt.smartindent = true -- Smart indent

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- remember history
vim.opt.undodir = vim.fn.expand '~/.vim/undodir'
vim.opt.swapfile = false
vim.opt.backup = false

-- Fix Typos
vim.cmd [[
  aug FixTypos
  :command! WQ wq
  :command! Wq wq
  :command! QA qa
  :command! Qa qa
  :command! W  w
  :command! Q  q
  :cmap     Q! q!
  aug end

  " In the quickfix/locationlist window, <CR> is used to jump to the error under the
  " cursor, so undefine the mapping there.
  autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
  autocmd BufReadPost loclist nnoremap <buffer> <CR> <CR>
]]

-- Go to definition splits in vertical window
vim.keymap.set('n', '<C-]>', ':vsplit<CR><C-]>', { noremap = true, silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Keeps the current visual block selection active after changing indent
vim.keymap.set('v', '>', "v:count == 0 ? '>gv' : '>'", { expr = true, silent = true })
vim.keymap.set('v', '<', "v:count == 0 ? '<gv' : '<'", { expr = true, silent = true })

-- highlight last paste
vim.keymap.set('n', 'gp', '`[v`]', { silent = true, noremap = true })

-- Switch terminal
vim.cmd [[
  tnoremap <c-h> <C-\><C-n><C-w>h
  tnoremap <c-j> <C-\><C-n><C-w>j
  tnoremap <c-k> <C-\><C-n><C-w>k
  tnoremap <c-l> <C-\><C-n><C-w>l
]]

-- Switch between buffers and tabs
vim.keymap.set('n', '<leader><tab>', '<C-^>')
vim.keymap.set('n', '<leader>1', '1gt')
vim.keymap.set('n', '<leader>2', '2gt')
vim.keymap.set('n', '<leader>3', '3gt')
vim.keymap.set('n', '<leader>4', '4gt')
vim.keymap.set('n', '<leader>5', '5gt')
vim.keymap.set('n', '<leader>6', '6gt')
vim.keymap.set('n', '<leader>7', '7gt')
vim.keymap.set('n', '<leader>8', '8gt')
vim.keymap.set('n', '<leader>9', '9gt')

-- border hover window
-- vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
local hover = vim.lsp.buf.hover
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function()
  return hover { max_width = 100, max_height = 14, border = 'rounded' }
end

-- border diagnostic floating window
vim.diagnostic.config {
  virtual_text = true,
  virtual_lines = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = true,
  },
}

-- Customize diagnostic signs
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = '',
  })
end

sign { name = 'DiagnosticSignError', text = '✘' }
sign { name = 'DiagnosticSignWarn', text = '▲' }
sign { name = 'DiagnosticSignHint', text = '⚑' }
sign { name = 'DiagnosticSignInfo', text = '𝒊' }

-- Diagnostic Keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.goto_prev { float = true }
end, { desc = 'Go to previous [D]iagnostic message' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.goto_next { float = true }
end, { desc = 'Go to next [D]iagnostic message' })
