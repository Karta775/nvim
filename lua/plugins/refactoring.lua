return {
  "ThePrimeagen/refactoring.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>rs", false, mode = {"i", "n", "s", "v"} },
  }
}
