return {
    "codewhisperer",
    name = "codewhisperer",
    url = "ssh://git.amazon.com/pkg/AmazonCodeWhispererVimPlugin",
    cmd = { "CWGenerateNvim", "CWTest", "CWPythonVersion" },
    keys = {
        { "<C-w>", "<cmd>:CWGenerateNvim<CR>", mode = { "i" }, desc = "CodeWhisperer complete" },
    },
    build = [[cat ~/.local/share/nvim/lazy/codewhisperer/service-2.json | jq '.metadata += {"serviceId":"codewhisperer"}' | tee /tmp/aws-coral-model.json && aws configure add-model --service-model file:///tmp/aws-coral-model.json --service-name codewhisperer]],
    dependencies = {
        { "nvim-telescope/telescope.nvim" },
    },
    config = function()
        require("codewhisperer").setup()
    end,

    vim.keymap.set({"n", "i"}, "<C-w>", "<cmd>:CWGenerateNvim<CR>", { silent = true })
}



-- return {
--     "neovim/nvim-lspconfig",
--     cmd = function ()
--         local lspconfig = require 'lspconfig'
--         local configs = require 'lspconfig.configs'
--         if not configs.codewhisperer then
--             configs.codewhisperer = {
--                 default_config = {
--                     -- Add the codewhisperer to our PATH or BIN folder
--                     cmd = { "cwls" },
--                     root_dir = lspconfig.util.root_pattern("packageInfo", "package.json", "tsconfig.json", "jsconfig.json", ".git"),
--                     filetypes = { 'java', 'python', 'typescript', 'javascript', 'csharp', 'ruby', 'kotlin', 'shell', 'sql', 'c', 'cpp', 'go', 'rust', 'lua' },
--                 },
--             }
--         end
--         lspconfig.codewhisperer.setup {}
--     end,
-- }


