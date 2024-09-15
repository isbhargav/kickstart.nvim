return {
  {
     -- "EdenEast/nightfox.nvim" ,
     -- 'dasupradyumna/midnight.nvim',
    "olimorris/onedarkpro.nvim",
    enabled = false,
    priority = 1000,
    init = function()
      vim.o.background = "dark"
      -- vim.cmd.colorscheme 'midnight'
      -- vim.cmd.colorscheme 'onedark_vivid'
    end
  },
}
