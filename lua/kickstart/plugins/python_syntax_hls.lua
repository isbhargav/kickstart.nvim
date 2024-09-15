-- semshi for additional syntax highlighting. 
-- See the README for Treesitter cs Semshi comparison.
-- requires `pynvim` (`python3 -m pip install pynvim`)
return 	{
  "wookayin/semshi", -- maintained fork
  enable=false,
  build = ":UpdateRemotePlugins",
  ft="python",
  version = "*",  -- Recommended to use the latest release
  init = function()
    vim.g.python3_host_prog = vim.fn.exepath("python3")

    -- Settings Copyied over from Lazy
    -- Disabled these features better provided by LSP or other more general plugins
    vim.g["semshi#error_sign"] = false
    vim.g["semshi#simplify_markup"] = false
    vim.g["semshi#mark_selected_nodes"] = false
    vim.g["semshi#update_delay_factor"] = 0.001

    -- This autocmd must be defined in init to take effect
    vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
      group = vim.api.nvim_create_augroup("SemanticHighlight", {}),
      callback = function()
	-- Only add style, inherit or link to the LSP's colors
	vim.cmd([[
	    highlight! link semshiGlobal  @none
	    highlight! link semshiImported @none
	    highlight! link semshiParameter @lsp.type.parameter
	    highlight! link semshiBuiltin @function.builtin
	    highlight! link semshiAttribute @field
	    highlight! link semshiSelf @lsp.type.selfKeyword
	    highlight! link semshiUnresolved @none
	    highlight! link semshiFree @none
	    highlight! link semshiAttribute @none
	    highlight! link semshiParameterUnused @none
	    ]])
      end,
    })
  end,
}
