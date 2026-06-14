return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    {
      'kristijanhusak/vim-dadbod-completion',
      ft = { 'sql', 'mysql', 'plsql' },
      lazy = true,
      init = function()
        vim.g.vim_dadbod_completion_lowercase_keywords = true
      end,
    }, -- Optional
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}

-- Usage
-- 1. Enable exrc with vim.opt.exrc = true OR use nvim-config-local
-- 2. create a .nvimrc file in the directory you want to have the specific url
-- 3. in the file, set the variable let g:db = 'postgresql://user:pass@localhost:5432/db_name
