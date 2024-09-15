---@module "lazy"
---@type LazySpec
return {
  enabled = false,
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  event = { 'InsertEnter', 'CmdlineEnter' },
  dependencies = {
    'rafamadriz/friendly-snippets',
    'MahanRahmati/blink-nerdfont.nvim',
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
    },
    {
      'Kaiser-Yang/blink-cmp-dictionary',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },
  },

  -- use a release tag to download pre-built binaries
  version = '*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    completion = {
      menu = {
        border = 'rounded',
        draw = {
          columns = {
            { 'label', 'label_description', gap = 1 },
            { 'kind_icon', 'kind' },
          },
          treesitter = { 'lsp' },
        },
      },
      list = {
        selection = {
          -- preselect = false,
          auto_insert = false,

          -- DO NOT PRESELECT IN CMDLINE
          preselect = function(ctx)
            return ctx.mode ~= 'cmdline'
          end,
          -- -- DO NOT AUTO-INSERT ONLY CMDLINE
          -- auto_insert = function(ctx)
          --   return ctx.mode ~= 'cmdline'
          -- end,
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 250,
        treesitter_highlighting = true,
        window = {
          border = 'rounded',
        },
      },
    },
    signature = { enabled = true, window = { border = 'rounded' } },
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = {
      preset = 'default',
      ['<CR>'] = { 'accept', 'fallback' },
      ['<C-h>'] = { 'snippet_backward', 'fallback' },
      ['<C-l>'] = { 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<Tab>'] = { 'select_next', 'fallback' },
    },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = {
        'lazydev',
        'lsp',
        'path',
        -- 'dictionary',
        'snippets',
        'buffer',
        'nerdfont',
      },
      per_filetype = {
        sql = { 'snippets', 'dadbod', 'buffer' },
      },
      providers = {
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
        dictionary = {
          module = 'blink-cmp-dictionary',
          name = 'Dict',
          -- Make sure this is at least 2.
          -- 3 is recommended
          min_keyword_length = 3,
          opts = {
            -- options for blink-cmp-dictionary
          },
        },
        dadbod = { name = 'Dadbod', module = 'vim_dadbod_completion.blink' },
        nerdfont = {
          module = 'blink-nerdfont',
          name = 'Nerd Fonts',
          score_offset = 15, -- Tune by preference
          opts = { insert = true }, -- Insert nerdfont icon (default) or complete its name
        },
      },
      -- Custom settings for cmdline
      cmdline = function()
        local type = vim.fn.getcmdtype()
        -- Search forward and backward
        if type == '/' or type == '?' then
          return { 'buffer' }
        end
        -- Commands
        if type == ':' or type == '@' then
          return { 'cmdline' }
        end
        return {}
      end,
      -- cmdline = {
      --   enabled = true,
      --   -- keymap = 'enter', -- Inherits from top level `keymap` config when not set
      --   -- sources = function()
      --   --   local type = vim.fn.getcmdtype()
      --   --   -- Search forward and backward
      --   --   if type == '/' or type == '?' then
      --   --     return { 'buffer' }
      --   --   end
      --   --   -- Commands
      --   --   if type == ':' or type == '@' then
      --   --     return { 'cmdline' }
      --   --   end
      --   --   return {}
      --   -- end,
      --   -- completion = {
      --   --   trigger = {
      --   --     show_on_blocked_trigger_characters = {},
      --   --     show_on_x_blocked_trigger_characters = nil, -- Inherits from top level `completion.trigger.show_on_blocked_trigger_characters` config when not set
      --   --   },
      --   --   menu = {
      --   --     auto_show = nil, -- Inherits from top level `completion.menu.auto_show` config when not set
      --   --     draw = {
      --   --       columns = { { 'label', 'label_description', gap = 1 } },
      --   --     },
      --   --   },
      --   -- },
      -- },
    },
  },
  opts_extend = { 'sources.default' },
}
