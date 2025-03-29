---@module "lazy"
---@type LazySpec
return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {
    'rafamadriz/friendly-snippets',
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
    },
  },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      preset = 'default',
      -- Can't get used to <c-y>
      ['<CR>'] = { 'accept', 'fallback' },
      -- I like moving with h -l
      ['<C-h>'] = { 'snippet_backward', 'fallback' },
      ['<C-l>'] = { 'snippet_forward', 'fallback' },
      -- cause sometimes I use tab
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<Tab>'] = { 'select_next', 'fallback' },
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
      documentation = { auto_show = true, window = { border = 'single' } },
      menu = {
        border = 'rounded',
        draw = {
          columns = { { 'label' }, { 'kind_icon', 'kind' } },
          treesitter = { 'lsp' },
        },
      },
    },
    signature = { enabled = true, window = { border = 'single' } },
    snippets = { preset = 'luasnip' },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev' },
      per_filetype = { sql = { 'dadbod' } },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        dadbod = { module = 'vim_dadbod_completion.blink' },
        cmdline = {
          -- ignores cmdline completions when executing shell commands
          enabled = function()
            return vim.fn.getcmdtype() ~= ':' or not vim.fn.getcmdline():match "^[%%0-9,'<>%-]*!"
          end,
          min_keyword_length = 2,
        },
      },
    },
    -- Custom settings for cmdline
    cmdline = {
      keymap = {
        ['<Tab>'] = { 'accept' },
        ['<CR>'] = { 'accept_and_enter', 'fallback' },
      },
      -- (optionally) automatically show the menu
      completion = {
        menu = { auto_show = true },
      },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = {
      implementation = 'prefer_rust_with_warning',
      sorts = {
        'exact',
        -- defaults
        'score',
        'sort_text',
      },
    },
  },
  opts_extend = { 'sources.default' },
}
