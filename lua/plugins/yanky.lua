return {
  "gbprod/yanky.nvim",
  event = "VeryLazy",
  config = function()
    require('yanky').setup {
      highlight = {
        timer = 80,
      },
    }

    local map = require('helpers.keys').map

    -- Keymaps
    map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", "Put")
    map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", "Put before")
    map({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)", "G put")
    map({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)", "G put before")
    map("n", "<c-p>", "<Plug>(YankyPreviousEntry)", "Previous yank")
    map("n", "<c-n>", "<Plug>(YankyNextEntry)", "Next yank")
  end
}
