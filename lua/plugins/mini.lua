return {
  {
    "echasnovski/mini.nvim",
    lazy = false,
    version = false,
    keys = {
      -- Git
      { "<leader>gC", "<cmd>Git commit --verbose<cr>", desc = "Commit" },
    },
    config = function()
      require("mini.extra").setup()
      local misc = require("mini.misc")
      misc.setup()
      misc.setup_termbg_sync()
      require("mini.git").setup()
    end,
  },
}
