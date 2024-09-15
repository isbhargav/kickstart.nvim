return {{
    'https://git.amazon.com/pkg/NvimAmznWiki',
    lazy = false,
    config = function()
        require("nvim-amzn-wiki").setup()
        vim.api.nvim_set_keymap('n',
            '<leader>wt',
            ':lua require("nvim-amzn-wiki.telescope_nvim_amzn_wiki").wiki_page_picker()<CR>',
            { noremap=true, silent=true }
        )
    end,
    requires = { "nvim-telescope/telescope.nvim" },
}}
