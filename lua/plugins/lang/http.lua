return {
  "mistweaverco/kulala.nvim",
  -- Better keymaps to enable opening Kulala scratchpad without opening a http filetype first
  keys = {
    { "<leader>R", "", desc = "+Rest" },
    { "<leader>RR", "<cmd>lua require('kulala').scratchpad()<cr>", desc = "Open scratchpad" },
    { "<leader>Rb", false },
  },
  opts = {},
}
