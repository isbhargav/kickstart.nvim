-- execute selection in tmux pane
---@module "lazy"
---@type LazySpec
return {
  'jpalardy/vim-slime',
  config = function()
    vim.cmd [[ let g:slime_target = "tmux" ]]
    vim.cmd [[ let g:slime_default_config = {"socket_name": "default", "target_pane": ".2"} ]]
    vim.cmd [[ let g:slime_dont_ask_default = 1 ]]
    vim.cmd [[ let g:slime_bracketed_paste = 1 ]]
  end,
}
