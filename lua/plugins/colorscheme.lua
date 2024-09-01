return {
  {
    "sainnhe/everforest",
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("everforest")
    end,
  },
  {
    "f-person/auto-dark-mode.nvim",
    event = "VeryLazy",
    opts = {}
  },
}
