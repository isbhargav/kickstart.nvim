---@module "lazy"
---@type LazySpec
return {
  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {

    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      'rafamadriz/friendly-snippets',
      { 'L3MON4D3/LuaSnip', version = 'v2.*' },
      { 'Kaiser-Yang/blink-cmp-dictionary', dependencies = { 'nvim-lua/plenary.nvim' } },
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
            -- -- DO NOT AUTO-INSERT IN CMDLINE
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
          'lsp',
          'path',
          -- 'dictionary',
          'snippets',
          'lazydev',
          'buffer',
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
        },
        -- Custom settings for cmdline
        cmdline = function()
          local type = vim.fn.getcmdtype()
          -- Search forward and backward
          if type == '/' or type == '?' then
            return { 'buffer' }
          end
          -- Commands
          if type == ':' then
            return { 'cmdline' }
          end
          return {}
        end,
      },
    },
    opts_extend = { 'sources.default' },
  },
}
