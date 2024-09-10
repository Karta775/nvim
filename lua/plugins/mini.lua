return {
  {
    "echasnovski/mini.nvim",
    lazy = false,
    version = false,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
    config = function()
      require("mini.bracketed").setup()
      require("mini.comment").setup()
      require("mini.diff").setup()
      require("mini.files").setup()
      require("mini.git").setup()
      require("mini.icons").setup()
      require("mini.jump").setup()
      require("mini.move").setup()
      require("mini.operators").setup()
      require("mini.pairs").setup()
      require("mini.surround").setup()
      require("mini.tabline").setup()

      require("mini.sessions").setup({
        autoread = false,
        autowrite = true,
        directory = vim.env.HOME .. "/.local/share/nvim/session",
      })

      require("mini.jump2d").setup({
        mappings = {
          start_jumping = "<C-f>",
        },
      })

      local notify = require("mini.notify")
      notify.setup({
        lsp_progress = {
          enable = false,
        },
      })
      -- vim.notify = notify.make_notify()
    end,
  },
  { -- Has its own spec for the event
    "echasnovski/mini.statusline",
    version = false,
    opts = {},
    event = "VeryLazy",
  },
}
