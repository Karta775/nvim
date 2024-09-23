return {
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("onedark")
    end,
  },
  -- {
  --   "f-person/auto-dark-mode.nvim",
  --   event = "VeryLazy",
  --   opts = {}
  -- },
}
