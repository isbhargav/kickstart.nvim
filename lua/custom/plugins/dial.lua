local logical_alias = {
  elements = { '&&', '||' },
  word = false,
  cyclic = true,
}

local ordinal_numbers = {
  -- elements through which we cycle. When we increment, we go down
  -- On decrement we go up
  elements = {
    'first',
    'second',
    'third',
    'fourth',
    'fifth',
    'sixth',
    'seventh',
    'eighth',
    'ninth',
    'tenth',
  },
  -- if true, it only matches strings with word boundary. firstDate wouldn't work for example
  word = false,
  -- do we cycle back and forth (tenth to first on increment, first to tenth on decrement).
  -- Otherwise nothing will happen when there are no further values
  cyclic = true,
}

local weekdays = {
  elements = {
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  },
  word = true,
  cyclic = true,
}

local months = {
  elements = {
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  },
  word = true,
  cyclic = true,
}

local capitalized_boolean = {
  elements = {
    'True',
    'False',
  },
  word = true,
  cyclic = true,
}

M = {
  'monaqa/dial.nvim',
  -- stylua: ignore
  keys = {
    { "<C-a>", function() require("dial.map").manipulate("increment", "normal") end, mode = "n" },
    { "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end, mode = "n" },
    { "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end, mode = "n" },
    { "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal") end, mode = "n" },
    { "<C-a>", function() require("dial.map").manipulate("increment", "visual") end, mode = "v" },
    { "<C-x>", function() require("dial.map").manipulate("decrement", "visual") end, mode = "v" },
    { "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end, mode = "v" },
    { "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual") end, mode = "v" },
  },

  config = function(_)
    local augend = require 'dial.augend'

    require('dial.config').augends:register_group {
      -- default augends used when no group name is specified
      default = {
        augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
        augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
        augend.constant.alias.bool, -- boolean value (true <-> false)
        augend.date.alias['%Y/%m/%d'], -- date (2022/02/19, etc.)
        augend.constant.new(logical_alias),
        augend.constant.new(ordinal_numbers),
        augend.constant.new(weekdays),
        augend.constant.new(months),
        augend.constant.new(capitalized_boolean),
      },

      -- augends used when group with name `mygroup` is specified
      mygroup = {
        augend.integer.alias.decimal,
        augend.constant.alias.bool, -- boolean value (true <-> false)
        augend.date.alias['%m/%d/%Y'], -- date (02/19/2022, etc.)
      },
    }
  end,
}

return M
