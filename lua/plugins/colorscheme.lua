return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("onedark").load()
    end,
  },
  {
    "echasnovski/mini.misc",
    version = "*",
    lazy = false,
    config = function()
      require("mini.misc").setup_termbg_sync()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      install = { colorscheme = { "onedark" } },
      colorscheme = "onedark",
    },
  },
  { "folke/tokyonight.nvim", enabled = false },
}
