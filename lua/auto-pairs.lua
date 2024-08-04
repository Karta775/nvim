
-- Used for auto generating pairs of symbols like brackets, quotes, etc.
require("nvim-autopairs").setup()

-- Auto insert braces after selecting a method
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
