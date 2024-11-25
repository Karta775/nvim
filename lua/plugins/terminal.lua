return {
  "folke/snacks.nvim",
  keys = {
    { "<C-/>", mode = { "t", "i", "n" }, false },
    { "<M-`>", "<cmd>lua Snacks.terminal.toggle()<cr>", mode = { "t", "i", "n" }, desc = "Toggle terminal" },
    { "-", "<cmd>lua Snacks.terminal('yazi')<cr>", desc = "File manager" },
    { "==", "<cmd>lua Snacks.terminal('lazygit')<cr>", desc = "Lazygit" },
  },
}
