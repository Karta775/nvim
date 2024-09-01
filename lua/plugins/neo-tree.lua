return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-tree").setup({})
    end,
  },
}
