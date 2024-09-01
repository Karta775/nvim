return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    config = function()
      require("avante").setup({
        provider = "claude",
      })
    end,
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
